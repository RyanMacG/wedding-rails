Rails.application.routes.draw do
  root 'application#index'
  post '/access-code', to: 'rsvps#find_rsvp'
  resources :rsvps, only: :update
end
