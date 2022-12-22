require 'rails_helper'

RSpec.describe GeneralShoppingListsController, type: :request do
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
    get general_shopping_lists_path
  end

  describe 'Testing the index method GeneralShoppingListController' do
    it 'should have http status of 200' do
      expect(response).to have_http_status :ok
    end
    it 'should redirect to index page' do
      expect(response).to render_template :index
    end
    it 'should have some html' do
      expect(response.body).to include 'Name'
      expect(response.body).to include 'Quantity'
      expect(response.body).to include 'Total Price'
      expect(response.body).to include 'Salt'
      expect(response.body).to include '2kg'
      expect(response.body).to include 20.to_s
    end
  end
end
