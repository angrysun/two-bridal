class Dress < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many_attached :photos

  validates :style, inclusion: { in: %w[Princess Mermaid A-Line Ballgown Empire Column Hi-Lo Asymmetrical Mini] }
  validates :brand, :color, :size, :style, :description, presence: true
  validates :size, numericality: { only_integer: true }
  validates :price_per_day, numericality: { only_integer: true }
end
