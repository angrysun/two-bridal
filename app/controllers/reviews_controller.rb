class ReviewsController < ApplicationController
  def index
  end

  def new
    @dress = Dress.find(params[:dress_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @dress = Dress.find(params[:dress_id])
    @review.dress = @dress
    if @review.save
      redirect_to dress_path(@dress)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
