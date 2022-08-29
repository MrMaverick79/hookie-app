Rails.application.routes.draw do
  
  
  
  root to: 'pages#home' 
  
  get '/login' => 'session#new' #login form

  post '/login' => 'session#create' #form submit and login or redirect

  delete '/login' => 'session#destroy' #logout
  
  resources :users, :links, :hooks, :tags

  #Delete User Route
  get '/users/:id/delete' => 'users#destroy', as: 'destroy_user'

  #Delete Link Route
  get '/links/:id/delete' => 'links#destroy', as: 'destroy_link'

  #Delete Hook Route
  get '/hooks/:id/delete' => 'hooks#destroy', as: 'destroy_hook'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
