class Ingredient < ApplicationRecord
  validates :name, presence: true

  belongs_to :mixed_drink
  has_man :drinks, through: :mixed_drinks

end
