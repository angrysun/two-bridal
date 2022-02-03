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

    respond_to do |format|
      if @review.save
        format.html { redirect_to dress_path(@dress) }
        format.json
      else
        format.html { render 'dresses/show' }
        format.json
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
