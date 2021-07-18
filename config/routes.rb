Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items 
  resources :cards, only: [:index, :new, :create, :destroy] 
  resources :posts do 
  collection do 
  post 'pay/:id'=>   'posts#pay' 
  end 
 end  
end
