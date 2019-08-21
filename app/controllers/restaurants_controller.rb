class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(create_restaurant_params)

      if @restaurant.save
        redirect_to @restaurant, notice: "Restaurant successfully created!"
      else
        render :new
      end
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def create_restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
