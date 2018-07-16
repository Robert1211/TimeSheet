Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:new, :create, :index]
  resources :jobs
  resources :projects
   resources :name, :only => [:new, :create]
  get '/login/' => 'session#new' # for login form
  post '/login' => 'session#create' # for a login
  


  delete '/login' => 'session#destroy' #  log out



end
