class AddTotalToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :total_price, :integer
  end
end
