# == Route Map
#
#     Prefix Verb   URI Pattern           Controller#Action
# user_token POST   /user_token(.:format) user_token#create
#       root GET    /                     home#index
#       auth GET    /auth(.:format)       home#auth
#      roles GET    /roles(.:format)      roles#index
#            GET    /roles/:id(.:format)  roles#show
#      users GET    /users(.:format)      users#index
#            POST   /users(.:format)      users#create
#       user GET    /users/:id(.:format)  users#show
#            PATCH  /users/:id(.:format)  users#update
#            PUT    /users/:id(.:format)  users#update
#            DELETE /users/:id(.:format)  users#destroy

Rails.application.routes.draw do
  # Crear el token
  post 'user_token' => 'user_token#create'
  
  # Indica a qué usuario pertenece el token generado
  root 'home#index'
  get 'auth' => 'home#auth'

  # Roles
  get 'roles' => 'roles#index'
  get 'roles/:id' => 'roles#show'

  # Users
  resources :users
end
