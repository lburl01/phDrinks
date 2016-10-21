class HomeController < ApplicationController

  before_action :authenticate_user!



  def index
    @user = User.find(current_user.id)
    @games = Game.where(user_id: @user)
  end


end
