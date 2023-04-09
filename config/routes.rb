Rails.application.routes.draw do
  resources :checks
  resources :day_of_weeks
  resources :habits
  resources :users
  get '/auth/github/callback' => 'auth#create'

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
