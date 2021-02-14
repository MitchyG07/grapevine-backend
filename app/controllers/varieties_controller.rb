class VarietiesController < ApplicationController


    def index  
        varieties = Wine.all.map { |w| w.variety }.uniq
        render json: varieties 
    end

    def show
        variety = Wine.where(variety: params[:variety], country: params[:country]) 
        render json: variety 
    end



end