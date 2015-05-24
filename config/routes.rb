Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :episode_ratings
  resources :episode_heart_beats

  resources :watch_list_entries do
    collection do
      get :add
    end
  end

  resources :tv_shows do
    collection do
      post :search
    end
    resources :episodes
  end

  get '/auth/:provider/callback', to: 'users#create'
  get "/signout" => "users#session_destroy", as: :signout

  get 'components' => 'home#components'
end
