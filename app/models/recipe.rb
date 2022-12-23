class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { maximum: 250 }
  validates :preparation_time, presence: true, length: { maximum: 10 }
  validates :cooking_time, presence: true, length: { maximum: 10 }
  validates :description, presence: true

  def total_price
    total = 0
    recipe_foods.each do |recipe_food|
      total += recipe_food.food.price * recipe_food.quantity
    end
    total
  end
end
