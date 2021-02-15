class ReviewedWinesController < ApplicationController

    def create
        render json: ReviewedWine.create(review_id: params[:review_id], wine_id: params[:wine_id])
    end
end
