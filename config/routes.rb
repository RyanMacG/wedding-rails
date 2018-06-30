Rails.application.routes.draw do
  root 'application#index'
  get '/rsvp', to: 'rsvps#landing', as: :rsvp_landing
  post '/access-code', to: 'rsvps#find_rsvp'
  get '/who-is-coming', to: 'rsvps#attending_list'
  resources :rsvps, only: :update
end
