class AddAvailableToDresses < ActiveRecord::Migration[6.1]
  def change
    add_column :dresses, :available, :boolean, default: true
  end
end
