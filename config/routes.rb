Rails.application.routes.draw do
  get  'welcom' => 'pages#home'
  resources :articles , param: :id
  root to: 'pages#home'
  #get '/articles/:id', to: 'articles#show', as: 'article'

 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
