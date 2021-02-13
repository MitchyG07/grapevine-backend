class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :favorites, dependent: :destroy
    has_many :wines, through: :favorites
end
