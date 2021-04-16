# frozen_string_literal: true

module API
  module V1
    module Helpers
      module Auth
        def generate_token(payload)
          JWT.encode(payload, private_key, "RS256")
        end

        def verify_token!
          return unauthorized! unless auth_token

          begin
            JWT.decode(auth_token, public_key, true, algorithm: "RS256")
          rescue JWT::DecodeError
            unauthorized!
          rescue JWT::ExpiredSignature
            token_expired!
          end
        end

        private

        def private_key
          OpenSSL::PKey::RSA.new(ENV["JWT_PRIVATE_KEY"])
        end

        def public_key
          OpenSSL::PKey::RSA.new(ENV["JWT_PUBLIC_KEY"])
        end

        def auth_token
          headers["Authorization"]&.split("Bearer:")&.last
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
