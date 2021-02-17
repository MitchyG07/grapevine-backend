class FavoritesController < ApplicationController

    def index 
        favorites = Favorite.all
        render json: favorites
    end

    def destroy
        favorite = Favorite.find(params[:id])
        favorite.destroy
    end

    def create
        favorite = Favorite.create(favorite_params)
        render json: favorite
    end 

    private

    def favorite_params
        params.require(:favorite).permit(:user_id, :wine_id)
    end
end
