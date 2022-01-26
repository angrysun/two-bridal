class DressesController < ApplicationController
  before_action :set_dress, only: %i[show edit update destroy]

  def index
    @dresses = policy_scope(Dress).order(created_at: :desc)
    @search = params[:search]
    if @search == nil
      @dresses = policy_scope(Dress).order(created_at: :desc)
    else
      @dresses = Dress.where('style LIKE ? OR description LIKE ? OR color LIKE ?', "%#{@search.capitalize}%", "%#{@search}%", "%#{@search.capitalize}%")
    end
  end

  def show
    authorize @dress
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

    redirect_to dresses_path
  end

  private

  def dress_params
    params.require(:dress).permit(:brand, :color, :size, :style, :description,
                                  :price_per_day, photos: [])
  end

  def set_dress
    @dress = Dress.find(params[:id])
  end
end
