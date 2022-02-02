class Booking < ApplicationRecord
  belongs_to :dress
  belongs_to :user

  validates :dress, :dress, :starting_date, :ending_date, :address, :post_code, :total_price, presence: true
  validates :post_code, length: { is: 7 }

  enum status: { pending: 0, accepted: 1, rejected: 2 }
end
