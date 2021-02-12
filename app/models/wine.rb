class Wine < ApplicationRecord
    has_many :reviewed_wines
    has_many :reviews, through: :reviewed_wines 
    has_many :favorites 
    has_many :users, through: :favorites 
end
