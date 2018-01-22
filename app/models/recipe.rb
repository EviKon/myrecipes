class Recipe < ApplicationRecord
  belongs_to :chef
  validates :name, :chef_id, presence: true
  validates :discription, presence: true, length: { minimum: 5 }
  default_scope -> { order(updated_at: :desc) }
end
