class AddLocationToDresses < ActiveRecord::Migration[6.1]
  def change
    add_column :dresses, :location, :string
  end
end
