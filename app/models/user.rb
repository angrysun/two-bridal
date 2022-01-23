class User < ApplicationRecord
  has_many :dresses, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookings_as_owner, through: :dresses, source: :bookings
  has_many :reviews, through: :dresses
  has_many :bookings
  # Need to double check with Teacher if these BOOKINGS associations are OK.
  # Also, our dependent destroy callings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
