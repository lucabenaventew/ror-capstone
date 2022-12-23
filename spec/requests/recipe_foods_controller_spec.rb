require 'rails_helper'

RSpec.describe RecipeFood, type: :request do
  before(:each) do
    @user = User.create(name: 'Hammas', created_at: Time.now, updated_at: Time.now,
                        email: 'test@email.com', encrypted_password: 'hammas')
    @user.confirm
    @food = Food.create(name: 'Salt', measurement_unit: 'kg', price: '10', created_at: Time.now,
                        updated_at: Time.now, user_id: @user.id)
    @recipe = Recipe.create(name: 'Pizza', preparation_time: '1 hour', cooking_time: '1 hour',
                            description: 'Today we are making pizza', public: true, created_at: Time.now,
                            updated_at: Time.now, user_id: @user.id)
    @recipe_food = RecipeFood.create(quantity: 2, created_at: Time.now, updated_at: Time.now,
                                     food_id: @food.id, recipe_id: @recipe.id)
    sign_in @user
    get new_recipe_recipe_food_path(@recipe)
  end
  describe 'Testing methods of RecipeFood Controller' do
    it 'should have http status 200' do
      expect(response).to have_http_status :ok
    end

    it 'should redirect to new recipe food page' do
      expect(response).to render_template :new
    end

    it 'should have some html' do
      expect(response.body).to include '<label class="form_field_label" for="recipe_food_quantity">Quantity</label>'
    end
  end
  describe 'Testing delete method of RecipeFood controller' do
    it 'should return total recipe foods' do
      expect(@recipe.recipe_foods.length).to be 1
    end
    it 'should delete the recipe food' do
      delete recipe_recipe_food_path(@recipe, @recipe_food)
      expect(@recipe.recipe_foods.length).to be 0
    end
  end
end
