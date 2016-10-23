Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get 'game/index'

  get 'game/new'

end
