class GameController < ApplicationController
  respond_to :json, :html, :jpg

  def new
    @five_random_drinks = Drink.get_random_drinks
  end
end
