require 'rails_helper'

RSpec.describe 'login page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tresor', email: 'test@email.com',
                        password: 'password', created_at: Time.now, updated_at: Time.now)

    @user.confirm

    Recipe.create(name: 'Apple Pie', preparation_time: '20 min', cooking_time: '45 min',
                  description: 'I remember ', public: true, user: @user, created_at: Time.now, updated_at: Time.now)
    Recipe.create(name: 'Apple Pie Hidden', preparation_time: '20 min', cooking_time: '45 min', description: 'I remember ', public: false, user: @user, created_at: Time.now, updated_at: Time.now)
    Recipe.create(name: 'Recipe', preparation_time: '20 min', cooking_time: '45 min', description: 'I remember ', public: true, user: @user, created_at: Time.now, updated_at: Time.now)

    visit new_user_session_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  context 'should render the public page' do
    it 'should render text on the page' do
      expect(page).to have_content('Apple Pie')
      expect(page).to have_content('Recipe')
    end

    it 'I cannot see those recipes which are not public.' do
      visit public_recipes_path
      expect(page).not_to have_content 'Apple Pie Hidden'
    end
  end
end
