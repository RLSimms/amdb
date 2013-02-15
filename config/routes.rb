Amdb::Application.routes.draw do
  root :to => 'Movies#index'

  get '/sessions/new' => 'Sessions#new'
  post '/sessions' => 'Sessions#create'
  delete '/sessions' => 'Sessions#destroy'

  resources :votes
  resources :users
  resources :roles
  resources :actors
  resources :movies
  resources :directors
end
