class ReviewsController < ApplicationController

    def index 
        reviews = Review.all 
        render json: reviews, only: [:content]
    end

    def create
        render json: Review.create(review_params)
    end

    def update
        review = Review.find(params[:id])
        review = Review.update(content: params[:content])
        render json: review
    end

    def destroy
        review = Review.find(params[:id])
        review.destroy
    end

   

    private 

    def review_params 
        params.require(:review).permit(:content, :user_id)
    end
end
