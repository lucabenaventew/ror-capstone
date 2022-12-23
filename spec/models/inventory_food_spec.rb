require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  before(:each) do
    @user = User.create(name: 'Tresor', email: 'tresor@dodso.fr', password: '11111111')
    expect(@user).to be_valid
    @recipe = Recipe.create(name: 'cookies', preparation_time: '02:00', cooking_time: '01:00', description: 'chocolat cookies', public: true, user: @user)
    @food = Food.create(name: 'Brown sugar', measurement_unit: 'g', price: 12, user: @user)
    @recipe_food = RecipeFood.create(quantity: 300, recipe: @recipe, food: @food)
  end

  after(:each) do
    User.destroy_all
    InventoryFood.destroy_all
  end

  it 'should create an food inventory' do
    expect(@recipe_food).to be_valid
    expect(@recipe_food.quantity).to eq(300)
    expect(@recipe_food.recipe).to eq @recipe
    expect(@recipe_food.food).to eq @food
  end
end
