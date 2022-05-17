Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/directors', to: 'directors#index'
  get '/directors/new', to: 'directors#new'
  post '/directors', to: 'directors#create'
  get '/directors/:id', to: 'directors#show'
  get '/directors/:id/edit', to: 'directors#edit'
  patch '/directors/:id/', to: 'directors#update'

  get '/films', to: 'films#index'
  get '/films/:id', to: 'films#show'
  get '/films/:id/edit', to: 'films#edit'
  patch '/films/:id', to: 'films#update'

  get '/directors/:director_id/films', to: 'director_films#index'
  get '/directors/:director_id/films/new', to: 'director_films#new'
  post '/directors/:director_id/films', to: 'director_films#create'
end
