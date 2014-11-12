Rails.application.routes.draw do

  get 'sessions/new'

  get 'users/new'

  root "pages#index"

  resources :articles
  resources :pages

  get '/search' => "articles#search"
  get '/about' => "pages#about"
  get '/relax' => "pages#relax"

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end

  get "/signup" => "users#new", :as => "signup"  
  get "/me" => "users#show", :as => "me"
  resources :users  
  resources :sessions
  resources :links

  get '/random' => "articles#random"
  get '/:id' => "articles#show", :as => "article_show"

end
