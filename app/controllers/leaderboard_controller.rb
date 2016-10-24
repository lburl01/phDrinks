class LeaderboardController < ApplicationController

  def index
    @leaders = Game.get_leaders
  end
end
