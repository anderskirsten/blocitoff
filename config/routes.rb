Rails.application.routes.draw do
  
  devise_for :users
  
  resources :users, only: :show
  
  authenticated :user do
    root 'users#show', as: :authenticated_root
  end
  
  get 'about' => 'welcome#about'
  
  get 'welcome' => 'welcome#index'

  root 'welcome#index'
end
