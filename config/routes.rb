Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'users/top-10-games', to: 'users#top_10_games'
      resources :users, only: [:index, :show, :create]
      get 'games/top-10', to: 'games#top_10'
      resources :games, only: [:index, :create]
      post '/signin', to: 'auth#signin'
    end
  end
end
