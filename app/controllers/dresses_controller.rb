class DressesController < ApplicationController
  def index
    @dresses = Dress.all
  end

  def show
    @dress = Dress.find(params[:id])
  end

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

  def destroy
    @dress = Dress.find(params[:id])
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
end
