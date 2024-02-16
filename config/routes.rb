Rails.application.routes.draw do


  root "articles#index"

  # get "/allarticles", to: "articles#index" #my_kind of convention routing

  # get "/articles/:id", to: "articles#show"

  # The route above declares that GET /articles requests are mapped to the index action of ArticlesController

  # Defines the root path route ("/")
  # root "posts#index"

  """
    If, I write resources:--> all the CRUD applications will get setted

        Prefix Verb   URI Pattern                  Controller#Action

        root  GET    /                            articles#index
    articles  GET    /articles(.:format)          articles#index
  new_article GET    /articles/new(.:format)      articles#new
    article   GET    /articles/:id(.:format)      articles#show
              POST   /articles(.:format)          articles#create
 edit_article GET    /articles/:id/edit(.:format)     articles#edit
              PATCH  /articles/:id(.:format)      articles#update
              DELETE /articles/:id(.:format)      articles#destroy
  """
  resources :articles do
    resources :comments
  end
end
