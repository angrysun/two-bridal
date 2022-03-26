class User < ApplicationRecord
  has_many :dresses, dependent: :destroy
  has_many :bookings_as_owner, through: :dresses, source: :bookings
  has_many :reviews
  has_many :bookings
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_favoritable
  acts_as_favoritor
end
