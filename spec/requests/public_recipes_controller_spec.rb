require 'rails_helper'

RSpec.describe PublicRecipesController, type: :request do
  before(:each) do
    @user = User.create(name: 'Hammas', created_at: Time.now, updated_at: Time.now,
                        email: 'test@email.com', encrypted_password: 'hammas')
    @user.confirm
    @user2 = User.create(name: 'Tresor', created_at: Time.now, updated_at: Time.now,
                         email: 'test2@email.com', encrypted_password: 'tresor')
    @user2.confirm
    @recipe = Recipe.create(name: 'Pizza', preparation_time: '1 hour', cooking_time: '1 hour',
                            description: 'Today we are making pizza', public: true, created_at: Time.now,
                            updated_at: Time.now, user_id: @user.id)
    @recipe2 = Recipe.create(name: 'Pasta', preparation_time: '1 hour', cooking_time: '1 hour',
                             description: 'Today we are making pizza', public: true, created_at: Time.now,
                             updated_at: Time.now, user_id: @user.id)
    @recipe3 = Recipe.create(name: 'Noodles', preparation_time: '1 hour', cooking_time: '1 hour',
                             description: 'Today we are making pizza', public: false, created_at: Time.now,
                             updated_at: Time.now, user_id: @user.id)
    get public_recipes_path
  end
  describe 'Testing methods of Public Recipe' do
    it 'index page should have http status 200' do
      expect(response).to have_http_status :ok
    end

    it 'should redirect to index page' do
      expect(response).to render_template :index
    end

    it 'should have some html' do
      expect(response.body).to include 'Pizza'
      expect(response.body).to include 'Pasta'
    end

    it 'should not render that item which is not public' do
      expect(response.body).not_to include 'Noodles'
    end
  end
end
