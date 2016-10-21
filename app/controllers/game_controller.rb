class GameController < ApplicationController
  respond_to :json, :html, :jpg

  def new
    @five_random_drinks = Drink.get_random_drinks
    @five_drinks_ids = MixedDrink.where(drink_id: @five_random_drinks)

    @drinks_ids_list = @five_drinks_ids.map do |id|
      { :drink_id => id.drink_id, :ingredient_id => id.ingredient_id }
    end

    @drinks_list = @five_random_drinks.map do |drink|
      { :id => drink.id, :name => drink.name }
    end

    @mixed_drinks = { :drinks => @drinks_list, :mixed_drinks => @drinks_ids_list }
    @mixed_drinks.to_json

  end
end
