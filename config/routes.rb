Rails.application.routes.draw do

  devise_for :users
  
  resources :users, only: :show do
    resources :items, only: [:create, :destroy]
  end
  
  get 'about' => 'welcome#about'
  
  get 'welcome' => 'welcome#index'
  
  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  root 'welcome#index'
end
