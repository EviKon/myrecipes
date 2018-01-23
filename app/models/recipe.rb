class Recipe < ApplicationRecord
  belongs_to :chef
  validates :name, :chef_id, presence: true
  validates :discription, presence: true, length: { minimum: 5 }
  default_scope -> { order(updated_at: :desc) }
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
