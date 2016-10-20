class Drink < ApplicationRecord
  validates :name, presence: true

  belongs_to :mixed_drink
  belongs_to :game
  has_many :ingredients, through: :mixed_drinks

end
