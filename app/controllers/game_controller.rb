class GameController < ApplicationController
  respond_to :json, :html, :jpg

  def new
    @drinks_data = MixedDrink.get_random_drink_info
    respond_with(@drinks_data)
  end
end
