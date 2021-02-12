class Review < ApplicationRecord
  belongs_to :user
  has_many :reviewed_wines
  has_many :wines, through: :reviewed_wines
end
