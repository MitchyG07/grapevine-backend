class CreateWines < ActiveRecord::Migration[6.1]
  def change
    create_table :wines do |t|
      t.string :title
      t.text :description
      t.string :variety
      t.string :designation
      t.string :country
      t.string :province
      t.string :winery
      t.string :points

      t.timestamps
    end
  end
end
