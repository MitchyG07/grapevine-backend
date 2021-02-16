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


    #backend function for heat map on home page
    def varietal_count
        varietal_array = []
        wine_array = ["Malbec", "Merlot", "Syrah", 'Cabernet Sauvignon', 'Pinot Noir', 'Grenache', 'Sangiovese', 'Tempranillo', 'Montepulcia', 'Petite Syrah', 'Chardonnay', 'Sauvignon blanc', 'Pinot Gris', 'Riesling', 'Semillon', 'Gewurztraminer', 'Chenin Blanc', 'Gruner Veltliner', 'Torrontes']
        country_iso_array = IsoCountryCodes.for_select.to_h
        
        # , "Pinot Noir",  "Merlot", "Malbec", "Syrah","Chardonnay","Sauvignon blanc","Pinot Gris","Riesling","Pinot Noir"]
    
        wine_array.map do |wine|
            countries = []
            count_array = []
            new_hash = {}
            wines = Wine.where(variety: wine)

            countries = wines.map do |wine| 
                if wine.country === "US"
                    country = "United States of America"
                    country_iso_array[country]
                elsif wine.country === "England"
                    country = "United Kingdom of Great Britain and Northern Ireland"
                    country_iso_array[country]
                else 
                    country_iso_array[wine.country]
                end
            end 

            
            count_array = countries.each_with_object(Hash.new(0)) {|k, v| v[k] += 1}
            keys = ['country','value']
            new_array = []

            count_array.keys.each do |iso| 
                if iso 
                    hash = {:country => iso, :value => count_array[iso]}
                    new_array.push(hash)
                end
            end

            new_hash = {:varietal => "#{wine}", :isoCodes => new_array}
            varietal_array.push(new_hash)
        end 
        render json: varietal_array
    end

end

