class Booking < ApplicationRecord
  belongs_to :dress
  belongs_to :user

  validates :dress, :starting_date, :ending_date, :address, :post_code, :total_price, presence: true
  validates :post_code, length: { is: 7 }
  validates :total_price, numericality: { greater_than: 0 }

  enum status: { pending: 0, accepted: 1, rejected: 2 }
end
