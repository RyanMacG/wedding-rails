Rails.application.routes.draw do
  root 'application#index'
  get '/rsvp', to: 'rsvps#landing', as: :rsvp_landing
  post '/access-code', to: 'rsvps#find_rsvp'
  get '/admin', to: 'rsvps#admin'
  resources :rsvps, only: :update
end
