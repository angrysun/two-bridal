class BookingsController < ApplicationController
  before_action :find_dress, only: %i[new create destroy]
  before_action :find_booking, only: %i[update destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @bookings = Booking.where(user: current_user)
    @booked = Booking.joins(:dress).where(
      dress: { user: current_user }
    )
    authorize @bookings
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
    @booking.total_price = @dress.price_per_day * (@booking.ending_date - @booking.starting_date)
    authorize @booking
    if @booking.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def update
    authorize @booking
    @booking.status = booking_params[:status]
    @booking.update(booking_params)
    redirect_to profile_path
  end

  def destroy
    authorize @booking
    flash[:remove] = "\"#{@booking.dress.brand} dress\" removed from bookings"
    @booking.destroy
    redirect_to bookings_path
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
    params.require(:booking).permit(:starting_date, :ending_date, :status, :address, :post_code, :total_price)
  end

  def find_dress
    @dress = Dress.find(params[:dress_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
