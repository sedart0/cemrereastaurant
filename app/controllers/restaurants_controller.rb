class RestaurantsController < ApplicationController

  def show
    @restaurants = Restaurant.all
    @items = Item.all


    @menu = @items.where(restaurant_id: params[:id])
    @appetizer = @menu.where(food_type: "food_app")
    @food = @menu.where(food_type: "food_main")
    @drink = @menu.where(food_type: "drink")
    @dessert = @menu.where(food_type: "food_dessert")
    # @special = @menu.where(food_type: "")
  end

end
