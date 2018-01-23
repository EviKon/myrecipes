class Comment < ApplicationRecord
  validates :description, presence: true
  belongs_to :recipe
  belongs_to :chef
  validates :chef_id, presence: true
  validates :recipe_id, presence: true
end
