class MixedDrink < ApplicationRecord
  validates :drink_id, :ingredient_id, presence: true

  belongs_to :drink
  belongs_to :ingredient

  def self.get_random_drink_info

    five_random_drinks_obj = Drink.get_random_drinks # gives unique ids of each drink

    drinks = five_random_drinks_obj.map do |drink|
      drink.id
    end

    sorted_drinks = drinks.sort

    ingredients_obj = MixedDrink.select('drink_id, ingredient_id, drinks.name as drink_name').joins("INNER JOIN drinks on mixed_drinks.drink_id = drinks.id").where(drink_id: drinks).order(:drink_id)

    drink_names_multiples = ingredients_obj.map do |drink|
      drink.drink_name
    end

    drink_names = drink_names_multiples.uniq

    ingredients = ingredients_obj.map do |drink|
      drink.ingredient_id
    end

    chunks = ingredients.each_slice(3).to_a

    all = { sorted_drinks[0] => {'name' => drink_names[0], 'ingredients' => chunks[0]}, sorted_drinks[1] => {'name' => drink_names[1], 'ingredients' => chunks[1]} }

  end

end
