Rails.application.routes.draw do

  root "pages#index"

  resources :articles
  resources :pages

  get '/search' => "articles#search"
  get '/about' => "pages#about"

end
