Rails.application.routes.draw do
  
  
  
  root to: 'pages#home' 
  get '/login' => 'session#new' #login form

  post '/login' => 'session#create' #form submit and login or redirect

  delete '/login' => 'session#destroy' #logout
  
  resources :users, :links, :hooks, :tags


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
