class Drink < ApplicationRecord
  validates :name, presence: true

  has_many :mixed_drinks
  has_many :games
  has_many :ingredients, through: :mixed_drinks

end
