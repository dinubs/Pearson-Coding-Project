Rails.application.routes.draw do

  root "articles#index"

  resources :articles

  get '/search' => "articles#search"

end
