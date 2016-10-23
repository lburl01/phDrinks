class GameController < ApplicationController
  respond_to :json, :html

  def new

  end

  def show
    respond_with(@drinks_data = MixedDrink.get_random_drink_info)
  end
end
