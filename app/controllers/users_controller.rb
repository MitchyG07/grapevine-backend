class UsersController < ApplicationController

    def show 
        user = User.find(params[:id])
        render json: user, only: [:username, :password, :bio]
    end

    def create
        render json: User.create(user_params)
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password, :bio)
    end

end
