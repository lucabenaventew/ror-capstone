class GeneralShoppingListsController < ApplicationController
  def index
    @total_items = remaining_foods.length
    @total_amount = total_amount
    @remain_foods = remaining_foods
  end

  private

  def remaining_foods
    total_recipe_foods = []
    current_user.recipes.includes(:recipe_foods).each do |recipe|
      recipe.recipe_foods.includes(:food).each do |recipe_food|
        total_recipe_foods << { name: recipe_food.food.name, quantity: recipe_food.quantity,
                                price: recipe_food.food.price, measurement_unit: recipe_food.food.measurement_unit }
      end
    end
    total_recipe_foods
  end

  def total_amount
    total_amount = 0
    remaining_foods.each do |food|
      total_amount += food[:price] * food[:quantity]
    end
    total_amount
  end
end
