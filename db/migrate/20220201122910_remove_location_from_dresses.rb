class RemoveLocationFromDresses < ActiveRecord::Migration[6.1]
  def change
    remove_column :dresses, :location, :string
    remove_column :dresses, :longitude, :float
    remove_column :dresses, :latitude, :float
  end
end
