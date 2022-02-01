class BookingsController < ApplicationController
  before_action :find_dress, only: %i[new create destroy]
  before_action :find_booking, only: %i[update destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.dress = @dress
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to profile_path
      # Changed path from "bookings_path to booking_path."
    else
      render :new
    end
  end

  def update
    authorize @booking
    @booking.status = booking_params[:status]
    @booking.update(booking_params)
    # had to pass an argument of booking_params to make it work for me
    redirect_to profile_path
  end

  def destroy
    authorize @booking
    flash[:remove] = "\"#{@booking.dress.brand} dress\" removed from bookings"
    # flash message to notify dress has been removed from bookings
    @booking.destroy
    redirect_to bookings_path
    # Changed path back to "bookings path""
  end

  def profile
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @bookings = Booking.where(user: current_user).where('ending_date >= ?', Date.today)
    @booked = Booking.joins(:dress).where(
      dress: { user: current_user }
    )
    authorize @bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date, :status)
  end

  def find_dress
    @dress = Dress.find(params[:dress_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
