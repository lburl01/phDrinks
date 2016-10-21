Rails.application.routes.draw do
  devise_for :users # once devise is done signing me up or in, it will go to root (or whatever's next)
  root to: "home#index"
end
