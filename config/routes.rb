Rails.application.routes.draw do
  devise_for :users # once devise is done signing me up or in, it will go to root (or whatever's next)
  root to: "home#index"

  get '/game/index'

  get '/game/new'

  get '/game/:id' => 'game#show'

  put '/game/:id' => 'game#update'

  get '/game/new/session' => 'game#send_session'

end
