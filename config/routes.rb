Rails.application.routes.draw do
  resources :rooms, only: [:new, :create] do
    member do
      get :host
      get :player
      post :start
    end
    collection do
      post :join
    end
  end

  resources :games, only: [:new, :create] do
    collection do
      get :play
      post :answer
      get :game_over
    end
  end

  root "rooms#new"
end