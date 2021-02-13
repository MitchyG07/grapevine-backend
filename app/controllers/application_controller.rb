class ApplicationController < ActionController::API

    def encode_token(payload)
        JWT.encode(payload, "super secret string")
    end

    def auth_header
        request.headers["Authorization"]
    end

    def decoded_token
        if auth_header
            token = auth_header.split(" ")[1]
            begin    
                JWT.decode(token, "my secret", true, algorithm: "HS256")
            rescue JWT::DecodeError
                []
            end
        end
    end

    

end
