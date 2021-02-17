class Wine < ApplicationRecord

    has_many :reviews
    has_many :favorites 
    has_many :users, through: :favorites 


end