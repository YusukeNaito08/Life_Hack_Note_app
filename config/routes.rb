Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#new_guest'
  end

  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update] do
    member do
      get :bookmarks
    end
  end
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :bookmarks, only: [:create, :destroy]
  end
  resources :inquiries, only: [:new, :create]
end
