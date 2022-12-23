require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'Tresor', email: 'tresor@dodo.fr', password: '11111111')
  end

  after(:each) do
    User.destroy_all
  end

  it 'should create a user' do
    @user = User.create(name: 'Tresor', email: 'tresorl@dodo.fr', password: '11111111')
    expect(@user).to be_valid
  end
end
