TechReviewSite::Application.routes.draw do
  devise_for :users
 root 'top#index'

 get '/product/:id' => 'products#show'
 get '/entry/:id' => 'top#entry'
 get '/search' => 'top#search'
 post '/entry/:id' => 'review#create'

 get '/users/:id' => 'users#show'
end
