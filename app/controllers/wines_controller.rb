class WinesController < ApplicationController

    def index
        wines = Wine.all
        render json: wines, only: [:title, :description, :variety, :designation, :country, :province, :winery, :points]
    end

    def show 
        wine = Wine.find(params[:id])
        render json: wine, only: [:title, :description, :variety, :designation, :country, :province, :winery, :points]
    end



end
