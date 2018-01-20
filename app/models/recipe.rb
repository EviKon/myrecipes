class Recipe < ApplicationRecord
  belongs_to :chef
  validates :name, :chef_id, presence: true
  validates :description, presence: true, length: { minimum: 5 }
end
