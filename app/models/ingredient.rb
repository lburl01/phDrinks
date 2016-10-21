class Ingredient < ApplicationRecord
  validates :name, presence: true

  has_many :mixed_drinks
  has_many :drinks, through: :mixed_drinks

end
