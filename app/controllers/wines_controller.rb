class WinesController < ApplicationController

    def index
        wines = Wine.all
        render json: wines 
    end

    def variety
        wines = Wine.where(variety: params[:variety], country: params[:country])
        render json: wines 
    end

    def show 
        wine = Wine.find(params[:id])
        render json: wine, include: [:reviews]
    end


    #organize by country for table render and regional variety
    def country_count
        varietal_array = []
        # wine_array = ["Malbec", "Merlot", "Syrah", 'Cabernet Sauvignon', 'Pinot Noir', 'Grenache', 'Sangiovese', 'Tempranillo', 'Montepulcia', 'Petite Syrah', 'Chardonnay', 'Sauvignon blanc', 'Pinot Gris', 'Riesling', 'Semillon', 'Gewurztraminer', 'Chenin Blanc', 'Gruner Veltliner', 'Torrontes']
        variety = Wine.where(variety: params[:variety])
        # , "Pinot Noir",  "Merlot", "Malbec", "Syrah","Chardonnay","Sauvignon blanc","Pinot Gris","Riesling","Pinot Noir"]
    
        countries = []
        count_array = []
        new_hash = {}

            countries = variety.map do |wine| 
                wine.country
            end 

            
            count_array = countries.each_with_object(Hash.new(0)) {|k, v| v[k] += 1}
            new_array = []

            count_array.keys.each do |country| 
                if country
                    hash = {:country => country, :value => count_array[country]}
                    new_array.push(hash)
                end
            end

        new_hash = {:countries => new_array}
        render json: new_hash
    end


    #backend function for heat map on home page
    def varietal_count
        varietal_array = []
        # wine_array = ["Malbec", "Merlot", "Syrah", 'Cabernet Sauvignon', 'Pinot Noir', 'Grenache', 'Sangiovese', 'Tempranillo', 'Montepulcia', 'Petite Syrah', 'Chardonnay', 'Sauvignon blanc', 'Pinot Gris', 'Riesling', 'Semillon', 'Gewurztraminer', 'Chenin Blanc', 'Gruner Veltliner', 'Torrontes']
        country_iso_array = IsoCountryCodes.for_select.to_h
        variety = Wine.where(variety: params[:variety])
        # , "Pinot Noir",  "Merlot", "Malbec", "Syrah","Chardonnay","Sauvignon blanc","Pinot Gris","Riesling","Pinot Noir"]
    
        countries = []
        count_array = []
        new_hash = {}

            countries = variety.map do |wine| 
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
            new_array = []

            count_array.keys.each do |iso| 
                if iso 
                    hash = {:country => iso, :value => count_array[iso]}
                    new_array.push(hash)
                end
            end

            new_hash = {:isoCodes => new_array}
            render json: new_hash
        end
    end 

