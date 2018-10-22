# == Route Map
#
#                         Prefix Verb   URI Pattern                                                          Controller#Action
#                     user_token POST   /user_token(.:format)                                                user_token#create
#                           root GET    /                                                                    home#index
#                           auth GET    /auth(.:format)                                                      home#auth
#                     role_users GET    /roles/:role_id/users(.:format)                                      users#index
#                                POST   /roles/:role_id/users(.:format)                                      users#create
#                      role_user GET    /roles/:role_id/users/:id(.:format)                                  users#show
#                                PATCH  /roles/:role_id/users/:id(.:format)                                  users#update
#                                PUT    /roles/:role_id/users/:id(.:format)                                  users#update
#                                DELETE /roles/:role_id/users/:id(.:format)                                  users#destroy
#                          roles GET    /roles(.:format)                                                     roles#index
#                                POST   /roles(.:format)                                                     roles#create
#                           role GET    /roles/:id(.:format)                                                 roles#show
#                                PATCH  /roles/:id(.:format)                                                 roles#update
#                                PUT    /roles/:id(.:format)                                                 roles#update
#                                DELETE /roles/:id(.:format)                                                 roles#destroy
#                         majors GET    /majors(.:format)                                                    majors#index
#                                POST   /majors(.:format)                                                    majors#create
#                          major GET    /majors/:id(.:format)                                                majors#show
#                                PATCH  /majors/:id(.:format)                                                majors#update
#                                PUT    /majors/:id(.:format)                                                majors#update
#                                DELETE /majors/:id(.:format)                                                majors#destroy
#                   universities GET    /universities(.:format)                                              universities#index
#                                POST   /universities(.:format)                                              universities#create
#                     university GET    /universities/:id(.:format)                                          universities#show
#                                PATCH  /universities/:id(.:format)                                          universities#update
#                                PUT    /universities/:id(.:format)                                          universities#update
#                                DELETE /universities/:id(.:format)                                          universities#destroy
#              type_publications GET    /type_publications(.:format)                                         type_publications#index
#                                POST   /type_publications(.:format)                                         type_publications#create
#               type_publication GET    /type_publications/:id(.:format)                                     type_publications#show
#                                PATCH  /type_publications/:id(.:format)                                     type_publications#update
#                                PUT    /type_publications/:id(.:format)                                     type_publications#update
#                                DELETE /type_publications/:id(.:format)                                     type_publications#destroy
#                 project_states GET    /project_states(.:format)                                            project_states#index
#                                POST   /project_states(.:format)                                            project_states#create
#                  project_state GET    /project_states/:id(.:format)                                        project_states#show
#                                PATCH  /project_states/:id(.:format)                                        project_states#update
#                                PUT    /project_states/:id(.:format)                                        project_states#update
#                                DELETE /project_states/:id(.:format)                                        project_states#destroy
#                document_states GET    /document_states(.:format)                                           document_states#index
#                                POST   /document_states(.:format)                                           document_states#create
#                 document_state GET    /document_states/:id(.:format)                                       document_states#show
#                                PATCH  /document_states/:id(.:format)                                       document_states#update
#                                PUT    /document_states/:id(.:format)                                       document_states#update
#                                DELETE /document_states/:id(.:format)                                       document_states#destroy
# user_project_project_documents GET    /users/:user_id/projects/:project_id/project_documents(.:format)     project_documents#index
#                                POST   /users/:user_id/projects/:project_id/project_documents(.:format)     project_documents#create
#  user_project_project_document GET    /users/:user_id/projects/:project_id/project_documents/:id(.:format) project_documents#show
#                                PATCH  /users/:user_id/projects/:project_id/project_documents/:id(.:format) project_documents#update
#                                PUT    /users/:user_id/projects/:project_id/project_documents/:id(.:format) project_documents#update
#                                DELETE /users/:user_id/projects/:project_id/project_documents/:id(.:format) project_documents#destroy
#                  user_projects GET    /users/:user_id/projects(.:format)                                   projects#index
#                                POST   /users/:user_id/projects(.:format)                                   projects#create
#                   user_project GET    /users/:user_id/projects/:id(.:format)                               projects#show
#                                PATCH  /users/:user_id/projects/:id(.:format)                               projects#update
#                                PUT    /users/:user_id/projects/:id(.:format)                               projects#update
#                                DELETE /users/:user_id/projects/:id(.:format)                               projects#destroy
#                          users GET    /users(.:format)                                                     users#index
#                                POST   /users(.:format)                                                     users#create
#                           user GET    /users/:id(.:format)                                                 users#show
#                                PATCH  /users/:id(.:format)                                                 users#update
#                                PUT    /users/:id(.:format)                                                 users#update
#                                DELETE /users/:id(.:format)                                                 users#destroy

Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Home controller routes
  root 'home#index'
  get 'auth' => 'home#auth'

  # Roles
  resources :roles do
    resources :users
  end

  # Majors
  resources :majors do
    resources :users

    resources :universities
  end

  # Universities
  resources :universities do
    resources :users

    resources :majors

    resources :images
  end

  # Users
  resources :users do
    resources :projects

    resources :images

    resources :universities

    resources :majors

    resources :project_documents do
      resources :user_project_documents
    end
  end

  # ProjectDocuments
  resources :project_documents do
    resources :documents

    resources :users do
      resources :user_project_documents
    end
  end

   # Projects
  resources :projects do
    resources :project_documents
  end

  # ProjectStates
  resources :project_states do
    resources :projects
  end

   # DocumentStates
   resources :document_states do
    resources :project_documents
   end

  # TypePublications
  resources :type_publications do
    resources :publications
  end

  # Publications
  resources :publications do
    resources :images

    resources :documents
  end
end
