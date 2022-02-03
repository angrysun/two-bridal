class Review < ApplicationRecord
  belongs_to :dress
  belongs_to :user

  validates :rating, :comment, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5 }
end
