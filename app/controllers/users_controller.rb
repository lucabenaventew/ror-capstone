class UsersController < ApplicationController
  validates :name, presence: true
  def index
    @user = User.new
  end
end
