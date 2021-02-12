class CreateReviewedWines < ActiveRecord::Migration[6.1]
  def change
    create_table :reviewed_wines do |t|
      t.references :wine, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
