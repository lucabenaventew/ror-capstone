class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(name: food_params[:name],
                     measurement_unit: food_params[:measurement_unit],
                     price: food_params[:price], user_id: current_user.id)
    if @food.save
      flash[:notice] = 'Food is successfully created'
      redirect_to foods_path
    else
      flash[:notice] = 'Invalid Entry'
      redirect_to new_food_path
    end
  end

  def destroy
    @food = Food.all.find(params[:id]).destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
