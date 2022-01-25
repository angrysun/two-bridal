class DressesController < ApplicationController
  def index
    @dresses = policy_scope(Dress).order(created_at: :desc)
  end

  def show
    @dress = Dress.find(params[:id])
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

  def destroy
    @dress = Dress.find(params[:id])
    authorize @dress
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
