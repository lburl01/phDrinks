class MixedDrink < ApplicationRecord
  validates :drink_id, :ingredient_id, presence: true

  belongs_to :drink
  belongs_to :ingredient

  def self.get_random_drink_info

    five_random_drinks_obj = Drink.get_random_drinks # gives unique ids of each drink

    drinks = five_random_drinks_obj.map do |drink|
      drink.id
    end

    ingredients_obj = MixedDrink.select('drink_id, ingredient_id, drinks.name as drink_name').joins("INNER JOIN drinks on mixed_drinks.drink_id = drinks.id").where(drink_id: drinks).order(:drink_id)

    ingredients = ingredients_obj.map do |drink|
      drink.ingredient_id
    end

    all = {'drinks' => drinks.sort, 'ingredients' => ingredients }

  end

end
