class Dress < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :style, inclusion: { in: %w[Princess Mermaid A-Line Ballgown Empire
                                        Column Hi-Lo Trumpet Asymmetrical Bateau Mini] }
  validates :brand, :color, :size, :style, :description, presence: true
  validates :size, numericality: { only_integer: true }
  validates :price_per_day, numericality: { only_integer: true }
  acts_as_favoritable

  include PgSearch::Model
  pg_search_scope :search_dresses,
                  against: %i[brand color style description],
                  using: {
                    tsearch: { prefix: true }
                  }
end
