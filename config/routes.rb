Rails.application.routes.draw do
  resources :songs
  resources :albums
  resources :artists
  devise_for :users
  resources :users, only: [:show,:index, :update, :destroy] do
    resources :playlists
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
