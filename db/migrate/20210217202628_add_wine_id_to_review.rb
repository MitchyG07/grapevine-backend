class AddWineIdToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :wine_id, :integer
  end
end
