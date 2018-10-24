Rails.application.routes.draw do
  root 'repos#index'
  devise_for :users
  resources :repos, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :repos, only: [:index]
    end
  end
end
