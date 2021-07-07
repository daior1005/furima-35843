Rails.application.routes.draw do
  devise_for :users
  get 'furimas/index'
  root to: "furimas#index"
  # resources :items, only: [:new, :create, :index, :show]


end
