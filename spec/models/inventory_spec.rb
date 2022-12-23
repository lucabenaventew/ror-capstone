require 'rails_helper'

RSpec.describe Inventory, type: :model do
  before(:each) do
    @user = User.create(name: 'Tresor', email: 'tresor@dodso.fr', password: '11111111')
    expect(@user).to be_valid
    @inventory = Inventory.create(name: "Tresor's inventory", user: @user)
  end

  after(:each) do
    User.destroy_all
    Inventory.destroy_all
  end

  it 'should create a recipe' do
    expect(@inventory).to be_valid
    expect(@inventory.name).to eq "Tresor's inventory"
    expect(@inventory.user).to eq @user
  end
end
