Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
 # patch “/bookings/:id/accept”, to: bookings#accept as: ‘accept’'
  #patch “/bookings/:id/decline”, to: bookings#decline, as: ‘decline’'
  root to: 'pages#home'
  get 'map', to: 'bikes#map'
  resources :bikes
  resources :bikes do
    resources :bookings, only:[:create,:new,:index,:show,:confirm ,:reject]
  end

  resources :bookings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
