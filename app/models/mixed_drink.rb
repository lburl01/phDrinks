class MixedDrink < ApplicationRecord
  validates :drink_id, :ingredient_id, presence: true

  belongs_to :drink
  belongs_to :ingredients

end
