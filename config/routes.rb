Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :post, only: [:index, :create, :show, :edit, :destroy]
end
