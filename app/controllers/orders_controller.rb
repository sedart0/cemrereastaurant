class OrdersController < ApplicationController

  def show
    @order = Order.last
    @restaurant = @order.table.restaurant
    @items = @restaurant.items
    @table = @order.table

    @menu = @items.where(restaurant_id: @restaurant.id)
    @appetizer = @menu.where(food_type: "food_app")
    @food = @menu.where(food_type: "food_main")
    @drink = @menu.where(food_type: "drink")
    @dessert = @menu.where(food_type: "food_dessert")
  end

  def create
    @table = Table.find(params[:table_id])
    @order = Order.create(table: @table)
    redirect_to order_path(@order)
  end

  def update
    @order = Order.find(params[:id])
  end


end
