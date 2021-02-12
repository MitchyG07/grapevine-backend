class ReviewedWine < ApplicationRecord
  belongs_to :wine
  belongs_to :review
end
