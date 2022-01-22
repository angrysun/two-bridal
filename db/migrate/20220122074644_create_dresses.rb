class CreateDresses < ActiveRecord::Migration[6.1]
  def change
    create_table :dresses do |t|
      t.string :brand
      t.string :color
      t.integer :size
      t.string :style
      t.text :description
      t.integer :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
