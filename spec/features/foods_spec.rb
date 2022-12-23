require 'rails_helper'

RSpec.describe 'login page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tresor', email: 'test@email.com',
                        password: 'password', created_at: Time.now, updated_at: Time.now)

    @user.confirm

    Food.destroy_all
    @food1 = Food.create(name: 'Broccoli', measurement_unit: 6, price: 7, user: @user)
    @food2 = Food.create(name: 'Sweet Potatoes', measurement_unit: 5, price: 15, user: @user)
    @food3 = Food.create(name: 'Watermelon', measurement_unit: 15, price: 25, user: @user)

    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  context 'should render the foods page' do
    it 'should render text on the page' do
      visit foods_path

      expect(page).to have_content('Add Food')
      expect(page).to have_content('Broccoli')
      expect(page).to have_content('Sweet Potatoes')
      expect(page).to have_content('Watermelon')
    end
  end

  context 'testing the add food process' do
    it 'should return error on logging in with empty fields' do
      visit new_food_path

      fill_in 'Name', with: 'Apple'
      fill_in 'Measurement unit', with: 'g'
      click_button 'Submit'
      expect(page).to have_content 'Invalid Entry'
    end

    it 'should create a new food' do
      visit new_food_path

      fill_in 'Name', with: 'Apple'
      fill_in 'Measurement unit', with: 'g'
      fill_in 'Price', with: 4
      click_button 'Submit'

      expect(page).to have_content 'Apple'
      expect(page).to have_content 'REMOVE'
    end
  end
end
