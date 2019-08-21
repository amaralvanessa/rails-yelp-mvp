class ReviewsController < ApplicationController
  def create
    @review = Review.new(create_review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant

      if @review.save
        redirect_to @restaurant, notice: "Review successfully created!"
      else
        render :new
      end
  end

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  private

  def create_review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end
end
