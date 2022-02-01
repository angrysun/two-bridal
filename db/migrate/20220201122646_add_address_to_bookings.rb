class AddAddressToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :address, :string
    add_column :bookings, :post_code, :integer
  end
end
