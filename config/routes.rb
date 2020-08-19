Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: 'pages#home'

  resources :bikes
  resources :bikes do
    resources :bookings, only:[:create,:new,:index,:show]
  end

  resources :bookings, only:[:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
