class FavoritesController < ApplicationController

    def destroy
        favorite = Favorite.find(params[:id])
        favorite.destroy
    end
    
end
