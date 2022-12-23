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

    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'hammas'
    click_button 'Log in'
    visit new_recipe_recipe_food_path(@recipe)
  end

  describe 'Testing the fields of new recipe food' do
    it 'should have text field for quantity' do
      expect(page).to have_field(type: 'text')
    end
    it 'should have the field of select for food' do
      expect(page).to have_field(type: 'select')
    end
    it 'should have some fields' do
      expect(page).to have_button(type: 'submit')
    end
  end
  describe 'Testing the form of new recipe food' do
    before(:each) do
      fill_in 'Quantity', with: '2'
      select(@food.name, from: 'recipe_food[food_id]')
      click_button 'Submit'
    end
    it 'should create a recipe food' do
      visit recipe_path(@recipe)
      expect(page).to have_content 'Salt'
    end
  end
end
