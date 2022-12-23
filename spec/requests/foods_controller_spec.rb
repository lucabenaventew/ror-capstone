require 'rails_helper'

RSpec.describe Food, type: :request do
  before(:each) do
    @user = User.create(name: 'Hammas', created_at: Time.now, updated_at: Time.now,
                        email: 'test@email.com', encrypted_password: 'hammas')
    @user.confirm
    sign_in @user
    get foods_path
  end
  describe 'Food Controller' do
    it 'gets the index page' do
      expect(response).to have_http_status :ok
    end

    it 'renders the index page' do
      expect(response).to render_template(:index)
    end

    it 'should have some html' do
      expect(response.body).to include '<table class="food_table" >'
    end
  end
  describe 'Testing the new method' do
    before(:example) { get new_food_path }
    it 'should redirect to add food page' do
      expect(response).to have_http_status :ok
    end

    it 'should render food page' do
      expect(response).to render_template :new
    end

    it 'should have some html' do
      expect(response.body).to include '<h1 class="food_form_heading">Add new food</h1>'
    end
  end
  describe 'should create food' do
    before(:each) do
      @food = Food.create(name: 'Apple', measurement_unit: 'kg', price: '10', created_at: Time.now,
                          updated_at: Time.now, user_id: @user.id)
    end
    it 'should create new food' do
      expect(@food).to be_valid
    end

    it 'should be of the person of id' do
      expect(@user.foods.count).to be 1
    end
  end
  describe 'should delete food' do
    before(:each) do
      @food = Food.create(name: 'Apple', measurement_unit: 'kg', price: '10', created_at: Time.now,
                          updated_at: Time.now, user_id: @user.id)
    end

    it 'should be of the person of id' do
      expect(@user.foods.count).to be 1
      @food.destroy
      expect(@user.foods.count).to be 0
    end
  end
end
