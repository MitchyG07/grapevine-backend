class User < ApplicationRecord
    has_many :reviews
    has_many :favorites 
    has_many :wines, through: :favorites
end
