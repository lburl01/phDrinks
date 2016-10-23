class GameController < ApplicationController
  respond_to :json, :html

  def new
    respond_with(@drinks_data = MixedDrink.get_random_drink_info)
  end

  def show
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(correct?: params[:score])
    render 'game/new'
  end
end
