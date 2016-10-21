class GameController < ApplicationController

  def index
    @games = Game.all_games(current_user)
    redirect_to '/'
  end
end
