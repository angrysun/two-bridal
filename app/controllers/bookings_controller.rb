class BookingsController < ApplicationController
  before_action :find_dress

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.dress = @dress
    @booking.user = @current_user
    if @booking.save
      redirect_to bookings_path
      # Is this the path we want to go to?
    else
      render :new
    end
    # change status?
  end

  # def destroy
  #   @booking = Booking.find(params[:id])
  #   flash[:remove] = "\"#{@dress.brand} dress\" removed from the bookings"
  #   # flash message to notify dress has been removed from bookings
  #   @booking.destroy
  #   redirect_to bookings_path
  #   # Is this the path we want to go to?
  # end

  # Commented out destroy method for now!

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :ending_date, :status)
  end

  def find_dress
    @dress = Dress.find(params[:dress_id])
  end
end
