class GameController < ApplicationController
  respond_to :json, :html
  skip_before_action :verify_authenticity_token, only: [:create]


  def new
    respond_with(@drinks_data = MixedDrink.get_random_drink_info)
  end

  def send_session
    respond_with(@session = Game.generate_session(current_user))
  end

  def show
    return @game = Game.find(params[:id]), @session = Game.generate_session(current_user)
  end

  def update
    @game = Game.find(params[:id])
    @game.update(correct?: params['score'])
  end

  def create
    @game = Game.create(
      user_id: current_user.id,
      drink_id: params['drink_id'],
      session: params['session'],
      correct?: params['score']
    )
  end
end
