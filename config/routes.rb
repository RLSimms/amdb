Amdb::Application.routes.draw do
  resources :votes


  resources :users


  root :to => 'Movies#index'

  get '/directors/autocomplete' => 'Directors#autocomplete', :as => 'autocomplete_directors'
  get '/movies/autocomplete' => 'Movies#autocomplete', :as => 'autocomplete_movies'
  get '/actors/autocomplete' => 'Actors#autocomplete', :as => 'autocomplete_actors'

  resources :roles
  resources :actors
  resources :movies
  resources :directors
end
