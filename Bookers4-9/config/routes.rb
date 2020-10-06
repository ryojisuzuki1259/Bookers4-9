Rails.application.routes.draw do
  get 'homes/top'
  get 'home/about'

  resources :homes, only: [:show, :create]
  #get 'users/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'homes#top'
  resources :books, only: [:new, :create, :index, :show]
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
