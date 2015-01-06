Rails.application.routes.draw do

  get 'sessions/new'

  get 'users/new'

  root "pages#index"

  resources :articles do
      member do
        get "like", to: "articles#vote"
        # Only uncomment below line if downvoting is implemented
        get "dislike", to: "articles#downvote"
      end
    end
  resources :pages

  get "/randomize", to: "articles#randomize"
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

  get 'docs/template' => "docs#template"
  get 'docs/links' => "docs#links"
  get 'docs/article' => "docs#article"
  get 'docs/link-from-article' => "docs#link_from_article"

  get '/api/users/login' => "users#api_auth"
  get '/api/users/show' => "users#api_show"
  get '/api/users/new' => "users#api_new"

  get '/random' => "articles#random"
  get '/:id' => "articles#show", :as => "article_show"

end
