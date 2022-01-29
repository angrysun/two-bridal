class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @bookings = Booking.where(user: current_user).where('ending_date >= ?', Date.today)
    @booked = Booking.joins(:dress).where(
      dress: { user: current_user }
      # it is possible to nest curlies
    )
  end

  def listings
    @dresses = Dress.where('user_id = ?', current_user)
  end
end
