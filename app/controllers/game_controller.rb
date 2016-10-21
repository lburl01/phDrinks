class GameController < ApplicationController

  respond_to :json, :html, :jpg

  def index
  end

  def new
    @games = Game.all
    respond_with(@games)
  end
end
