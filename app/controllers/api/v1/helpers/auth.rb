# frozen_string_literal: true

module API
  module V1
    module Helpers
      module Auth
        def generate_token(payload)
          JWT.encode(payload, private_key, "RS256")
        end

        def decoded_token(request)
          if auth_header
            token = auth_header.split(' ')[1]

            begin
              JWT.decode(token, public_key, true, algorithm: 'RS256')
            rescue JWT::DecodeError
              nil
            end
          end
        end
        private

        # Generate private & public RSA keys
        # def generate_rsa_keys
        #   rsa_private = OpenSSL::PKey::RSA.generate(2048)
        #   rsa_public = rsa_private.public_key
        # end

        def private_key
          ENV["JWT_PRIVATE_KEY"]
        end

        def public_key
          ENV["JWT_PUBLIC_KEY"]
        end

        def auth_header
          request.headers['Authorization']
        end
      end
    end
  end
end
