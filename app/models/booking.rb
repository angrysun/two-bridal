class Booking < ApplicationRecord
  belongs_to :dress
  belongs_to :user

  validates :dress, :starting_date, :ending_date, :address, :post_code, :total_price, presence: true
  validates :post_code, length: { is: 7 }
  validates :total_price, numericality: { greater_than: 0 }

  validate :start_date_cannot_be_in_the_past
  # special validate class for booking, thats why theres no 's'


  enum status: { pending: 0, accepted: 1, rejected: 2 }

  def start_date_cannot_be_in_the_past
    if starting_date.present? && starting_date < Date.today
      errors.add(:starting_date, 'cannot be in the past')
    end
  end
end
