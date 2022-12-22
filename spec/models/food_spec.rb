require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.create(name: 'Tresor', email: 'tresor@dodso.fr', password: '11111111')
    expect(@user).to be_valid
    @food = Food.create(name: 'Brown sugar', measurement_unit: 'g', price: 12, user: @user)
  end

  after(:each) do
    User.destroy_all
    Food.destroy_all
  end

  it 'should create a food' do
    expect(@food).to be_valid
    expect(@food.name).to eq 'Brown sugar'
    expect(@food.measurement_unit).not_to eq 'grams'
    expect(@food.price).to eq(12)
    expect(@food.user).to eq @user
  end
end
