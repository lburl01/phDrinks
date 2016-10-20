class Ingredient < ApplicationRecord
  validates :name, :category_id, presence: true

  belongs_to :mixed_drink
  has_on :category
  has_man :drinks, through: :mixed_drinks

end
