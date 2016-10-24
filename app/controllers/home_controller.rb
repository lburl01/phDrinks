class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @users_games = Game.where(user_id: @user)

    @total_sessions = @users_games.maximum(:session)

    if !@total_sessions.nil?
      @range = (1..@total_sessions)

      @sessions_scores = {}
      @range.each do |i|
        @sessions_scores[i] = Game.where(user_id: @user).where(session: i).sum(:correct?)
      end
    end

  end

end
