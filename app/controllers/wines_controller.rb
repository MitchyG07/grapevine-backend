class WinesController < ApplicationController

    def index
        wines = Wine.all
        render json: wines 
    end

    def variety
        wines = Wine.where(variety: params[:variety])
        render json: wines 
    end

    def show 
        wine = Wine.find(params[:id])
        render json: wine, only: [:title, :description, :variety, :designation, :country, :province, :winery, :points]
    end

    def varietal_count_by_country
        variety_array = []
        count_array = []
        wine_array = ["Cabernet Sauvignon", "Pinot Noir",  "Merlot", "Malbec", "Syrah","Chardonnay","Sauvignon blanc","Pinot Gris","Riesling","Pinot Noir"]
    
        wine_array.map do |wine|
            map = []
            array = Wine.all.select{ |wine| wine.variety === wine }
            array = array.map{|wine| wine.country}
            map = array.each_with_object(Hash.new(0)) {|k, v| v[k] += 1}
            new_hash = {"#{wine}" => map}
            varietal_array.push(new_hash)
        end 
    end

end

