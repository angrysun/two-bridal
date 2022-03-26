class Booking < ApplicationRecord
  belongs_to :dress
  belongs_to :user

  validates :dress, :starting_date, :ending_date, :address, :post_code, :total_price, presence: true
  validates :post_code, length: { is: 7 }

  validate :start_date_cannot_be_in_the_past, :start_date_cannot_be_before_end_date
  # special validate class for booking, thats why theres no 's'


  enum status: { pending: 0, accepted: 1, rejected: 2 }

  def start_date_cannot_be_in_the_past
    if starting_date.present? && starting_date < Date.today
      errors.add(:starting_date, 'cannot be in the past')
    end
  end

  def start_date_cannot_be_before_end_date
    if starting_date.present? && ending_date < starting_date
      errors.add(:starting_date, 'cannot be after Ending date')
    end
  end
end
