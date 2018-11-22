# == Route Map
#
#             Prefix Verb   URI Pattern                   Controller#Action
#         user_token POST   /user_token(.:format)         user_token#create
#               root GET    /                             home#index
#               auth GET    /auth(.:format)               home#auth
#              roles GET    /roles(.:format)              roles#index
#                    GET    /roles/:id(.:format)          roles#show
# universities_names GET    /universities_names(.:format) universities#index_names
#       universities GET    /universities(.:format)       universities#index
#                    POST   /universities(.:format)       universities#create
#         university GET    /universities/:id(.:format)   universities#show
#                    PATCH  /universities/:id(.:format)   universities#update
#                    PUT    /universities/:id(.:format)   universities#update
#                    DELETE /universities/:id(.:format)   universities#destroy
#         users_self GET    /users_self(.:format)         users#show_self
#                    PATCH  /users_self(.:format)         users#update_self
#                    PUT    /users_self(.:format)         users#update_self
#                    DELETE /users_self(.:format)         users#destroy_self
#              users GET    /users(.:format)              users#index
#                    POST   /users(.:format)              users#create
#               user GET    /users/:id(.:format)          users#show
#                    PATCH  /users/:id(.:format)          users#update
#                    PUT    /users/:id(.:format)          users#update
#                    DELETE /users/:id(.:format)          users#destroy

Rails.application.routes.draw do
  # Crear el token
  post 'user_token' => 'user_token#create'
  
  # Indica a qué usuario pertenece el token generado
  root 'home#index'
  get 'auth' => 'home#auth'

  # Roles
  get 'roles' => 'roles#index'
  get 'roles/:id' => 'roles#show'

  # Universities
  get 'universities_names' => 'universities#index_names'
  resources :universities

  # Users
  get 'users_self' => 'users#show_self'
  patch 'users_self' => 'users#update_self'
  put 'users_self' => 'users#update_self'
  delete 'users_self' => 'users#destroy_self'
  resources :users
end
