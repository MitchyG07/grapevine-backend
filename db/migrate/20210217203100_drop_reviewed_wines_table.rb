class DropReviewedWinesTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :reviewed_wines
  end
end
