Rails.application.routes.draw do
  default_url_options :host => 'localhost:3000'
  resources :users, param: :_username
  resources :houses
  post '/auth/login', to: 'authentication#login'
  post '/users/google', to: 'users#google'
end
