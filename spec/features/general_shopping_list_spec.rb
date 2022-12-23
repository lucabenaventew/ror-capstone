require 'rails_helper'

RSpec.describe 'general shopping list', type: :feature do
  before(:each) do
    @user = User.create(name: 'Hammas', created_at: Time.now, updated_at: Time.now,
                        email: 'test@email.com', password: 'hammas')
    @user.confirm
    @food = Food.create(name: 'Salt', measurement_unit: 'kg', price: '10', created_at: Time.now,
                        updated_at: Time.now, user_id: @user.id)
    @recipe = Recipe.create(name: 'Pizza', preparation_time: '1 hour', cooking_time: '1 hour',
                            description: 'Today we are making pizza', public: true, created_at: Time.now,
                            updated_at: Time.now, user_id: @user.id)
    @recipe_food = RecipeFood.create(quantity: 2, created_at: Time.now, updated_at: Time.now,
                                     food_id: @food.id, recipe_id: @recipe.id)

    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'hammas'
    click_button 'Log in'
  end

  describe 'Testing the index page' do
    it 'should have some html' do
      visit general_shopping_lists_path
      expect(page).to have_content 'Name'
      expect(page).to have_content 'Quantity'
      expect(page).to have_content 'Total Price'
      expect(page).to have_content 'Salt'
      expect(page).to have_content '2kg'
      expect(page).to have_content 20.to_s
    end
  end
end
