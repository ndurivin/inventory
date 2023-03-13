class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :model
      t.string :brand
      t.string :image_url
      t.string :color
      t.integer :state

      t.timestamps
    end
  end
end
