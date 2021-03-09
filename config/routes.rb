Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :users, only: [:show, :edit, :update]
  resources :post, only: [:index, :create, :show, :edit, :update, :destroy]
end
