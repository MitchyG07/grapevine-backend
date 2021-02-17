class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def show 
        user = User.find(params[:id])
<<<<<<< HEAD
       
        render json: user, include: [:reviews, :wines ]
       
=======
        render json: user, include: :wines
>>>>>>> harbor-humpies
    end

    def create
        user = User.create(user_params)
        if user.valid? 
            my_token = encode_token({user_id: user.id})
            render json: {id: user.id, username: user.username, token: my_token}
        else 
            render json: {error:'failed to create a user'}
        end
    end

    def update
        user = User.find(params[:id])
        user.update(bio: params[:bio])
      
        render json: user, include: [:reviews, :wines]
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password, :bio)
    end

end
