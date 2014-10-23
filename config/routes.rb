Rails.application.routes.draw do

  root "pages#index"

  resources :articles
  resources :pages

  get '/search' => "articles#search"
  get '/about' => "pages#about"
  get '/relax' => "pages#relax"

end
