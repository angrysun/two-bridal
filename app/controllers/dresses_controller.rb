class DressesController < ApplicationController
  before_action :set_dress, only: %i[show edit update destroy]

  def index
    @dresses = Dress.all
  end

  def show; end

  def new
    @dress = Dress.new
  end

  def create
    @dress = Dress.new(dress_params)
    @dress.user = current_user
    if @dress.save
      redirect_to dress_path(@dress)
    else
      render :new
    end
  end

  def edit; end

  def update
    @dress.update(dress_params)
    @dress.user = current_user
    if @dress.save
      redirect_to dress_path(@dress)
    else
      render :edit
    end
  end

  def destroy
    @dress.destroy
    flash[:remove] = "Successfully deleted"
    #thanks for the great idea Gary

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
