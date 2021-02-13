class UsersController < ApplicationController
    has_secure_password

    def show 
        user = User.find(params[:id])
        render json: user, only: [:username, :password, :bio]
    end

    def create
        user = User.create(user_params)
        #remember to add login validations! 
        payload = {user_id: user.id}
        token = encode_token(payload)
        render json: {user: user, jwt: token}
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
