class MixedDrink < ApplicationRecord
  validates :drink_id, :ingredient_id, presence: true

  has_many :drinks
  has_many :ingredients

end
