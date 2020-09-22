Rails.application.routes.draw do
  resources :tournament_teams
  resources :members
  resources :teams
  resources :tournaments
  devise_for :users
  root 'teams#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
