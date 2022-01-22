class Dress < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :brand, :color, :size, :style, :description, presence: true
  validates :size, numericality: { only_integer: true }
  validates :price_per_day, numericality: { only_integer: true }
end
