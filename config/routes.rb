Rails.application.routes.draw do

  root "pages#index"

  resources :articles
  resources :pages

  get '/search' => "articles#search"
  get '/about' => "pages#about"
  get '/relax' => "pages#relax"

  get '/:id' => "articles#show", :as => "article_show"

end
