class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    # binding.pry
    @user = User.find(current_user.id)
    @unique_games = Game.where(user_id: @user).uniq.pluck(:session)
    @games = []
    @unique_games.each do |session_id|
      @games.push(Game.find_by(session: session_id))
    end
  end


end
