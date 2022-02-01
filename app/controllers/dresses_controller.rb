class DressesController < ApplicationController
  before_action :set_dress, only: %i[show edit update destroy favorite]

  def index
    @dresses = policy_scope(Dress).order(created_at: :desc)
    if params[:query].present?
      @dresses = Dress.search_dresses(params[:query])
    else
      @dresses = Dress.all
    end
  end

  def show
    authorize @dress
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @dress = Dress.new
    authorize @dress
  end

  def create
    @dress = Dress.new(dress_params)
    authorize @dress
    @dress.user = current_user
    if @dress.save
      redirect_to dress_path(@dress)
    else
      render :new
    end
  end

  def edit
    authorize @dress
  end

  def update
    authorize @dress
    @dress.update(dress_params)
    @dress.user = current_user
    if @dress.save
      redirect_to dress_path(@dress)
    else
      render :edit
    end
  end

  def destroy
    authorize @dress
    @dress.destroy
    flash[:remove] = "Successfully deleted"

    redirect_to listings_path
  end

  def favorite
    authorize @dress
    if current_user.favorited?(@dress)
      current_user.unfavorite(@dress)
    else
      current_user.favorite(@dress)
    end

    respond_to do |format|
      format.js
    end
  end

  def favorites
    @dresses = policy_scope(Dress).order(created_at: :desc)
    @fav_dresses = current_user.all_favorited
    authorize @dresses

    respond_to do |format|
      format.js
    end
  end

  def listings
    @dresses = policy_scope(Dress).order(created_at: :desc)
    @dresses = Dress.where('user_id = ?', current_user)
    authorize @dresses
  end

  private

  def dress_params
    params.require(:dress).permit(:brand, :color, :size, :style, :description,
                                  :price_per_day, :longitude, :latitude, photos: [])
  end

  def set_dress
    @dress = Dress.find(params[:id])
  end
end
