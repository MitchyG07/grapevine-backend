class Wine < ApplicationRecord
    has_many :reviewed_wines
    has_many :reviews, through: :reviewed_wines 
    has_many :favorites 
    has_many :users, through: :favorites 

    def varietal_count_by_country
        varietal_object = Wine.all.select{ |wine| wine.variety === "Merlot" }
        byebug
    end

end