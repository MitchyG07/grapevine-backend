class AuthController < ApplicationController 
    before_action :require_login

    def login
        user = User.find_by(params [:username])
        if user && user.authenticate(params [:password])
            payload = {user_id: user.id} 
            token = encode_token(payload)
            render json: {user: user, jwt: token, success: "Welcome back! #{user.username}"}
        else                           
            render json: {failure: "Incorrect username or password"}
        end
    end

    def auto_login
        if session_user 
            render json: session_user
        else                 
            render json: {errors: "No user logged in!"}
        end
    end

    def session_user
        decoded_hash = decoded_token 
        if !decoded_hash.enmpty? 
            user_id = decoded_hash[0][user_id]
            @user = User.find_by(id: user_id)
        else                
            nil 
        end
    end 

    def logged_in? 
        !!session_user 
    end
    
    def require_login
        render json: {message: "Please login to use Grapevine!"}, status: :unauthorized unless logged_in?
    end


end