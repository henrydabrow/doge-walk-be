# frozen_string_literal: true

module API
  module V1
    module Helpers
      module Auth
        def current_user
          user_id = decoded_token(refresh_token).fetch("user_id") if refresh_token
          user_id = decoded_token(auth_token).fetch("user_id") if auth_token

          User.find(user_id)
        end

        def generate_token(payload)
          payload_with_expiration = add_expiration(payload)

          t = JWT.encode(payload_with_expiration, private_key, "RS256")
          p "JWT: ", decoded_token(t)
          t
        end

        def set_cookie(path, user_id)
          rjwt = JWT.encode({ user_id: user_id, exp: (Time.now + 600.seconds).to_i }, private_key, "RS256")
          p "RJWT: ", decoded_token(rjwt)
          {
            value: rjwt,
            http_only: true,
            secure: true,
            expires: Time.now + 36000,
            same_site: :none,
            path: path
          }
        end

        def verify_token!
          p 'Verify JWT token!'
          return unauthorized! unless auth_token

          begin
            decoded_token(auth_token)
          rescue JWT::ExpiredSignature
            p 'JWT token expired!'
            begin
              user_id = decoded_token(refresh_token).fetch("user_id")
              p 'Refresh JWT from REFRESH token'
              generate_token(user_id: user_id)
            rescue JWT::ExpiredSignature
              p 'REFRESH token also expired!'
              token_expired!
            rescue JWT::DecodeError
              unauthorized!
            end
          rescue JWT::DecodeError
            unauthorized!
          end
        end

        def verify_refresh_token!
          p 'Verify REFRESH token!'
          return unauthorized! unless refresh_token

          begin
            decoded_token(refresh_token)
            p 'REFRESH token refreshed!'
          rescue JWT::ExpiredSignature
            p 'REFRESH token expired!'
            token_expired!
          rescue JWT::DecodeError
            unauthorized!
          end
        end

        private

        def add_expiration(payload)
          # jwt_validity_in_hours = ENV["JWT_VALIDITY_IN_HOURS"].to_i
          # expiration_timestamp  = (Time.now + jwt_validity_in_hours.hours).to_i
          expiration_timestamp  = (Time.now + 300.seconds).to_i

          payload.merge(
            {
              exp: expiration_timestamp,
            }
          )
        end

        def decoded_token(token)
          begin
            JWT.decode(token, public_key, true, algorithm: "RS256").first
          rescue
            unauthorized!
          end
        end

        def private_key
          OpenSSL::PKey::RSA.new(ENV["JWT_PRIVATE_KEY"])
        end

        def public_key
          OpenSSL::PKey::RSA.new(ENV["JWT_PUBLIC_KEY"])
        end

        def auth_token
          headers["Authorization"]&.split("Bearer:")&.last
        end

        def refresh_token
          cookies["jid"]
        end

        def unauthorized!
          error!({ errors: ["Unauthorized"] }, 401)
        end

        def token_expired!
          error!({ errors: ["Expired token"] }, 401)
        end
      end
    end
  end
end
