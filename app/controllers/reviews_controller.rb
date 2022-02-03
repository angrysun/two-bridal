class ReviewsController < ApplicationController
  # def new
  #   @dress = Dress.find(params[:dress_id])
  #   authorize @dress
  #   @review = Review.new
  #   authorize @review
  # end

  def create
    @review = Review.new(review_params)
    authorize @review
    @dress = Dress.find(params[:dress_id])
    @review.dress = @dress
    if @review.save
      redirect_to dress_path(@dress, anchor: "review-#{@review.id}")
    else
      render 'dresses/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
