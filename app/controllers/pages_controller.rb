class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @bookings = Booking.where('user_id = ?', current_user)
    @booked = Booking.where('dress.user = ?', current_user)
  end

  def listings
    @dresses = Dress.where('user_id = ?', current_user)
  end
end
