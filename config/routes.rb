Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :users, only: [:show, :edit, :update] do
    collection do
      get :bookmarks
    end
  end  
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  resources :posts, only: [:create, :index, :show, :edit, :update, :destroy] do
   resource :bookmarks, only:[:create,:destroy]
  end
  get 'bookmarks/index' => 'bookmarks#index'
  resources :inquiries, only:[:new, :create]
end


 

