class Booking < ApplicationRecord
  belongs_to :dress
  belongs_to :user

  validates :dress, presence: true
  validates :user, presence: true
  validates :starting_date, presence: true
  validates :ending_date, presence: true
end
