# == Route Map
#
#                     Prefix Verb   URI Pattern                                                   Controller#Action
#                 user_token POST   /user_token(.:format)                                         user_token#create
#                       root GET    /                                                             home#index
#                       auth GET    /auth(.:format)                                               home#auth
#                      roles GET    /roles(.:format)                                              roles#index
#                            GET    /roles/:id(.:format)                                          roles#show
#            document_states GET    /document_states(.:format)                                    roles#index
#                            GET    /document_states/:id(.:format)                                roles#show
#         universities_names GET    /universities_names(.:format)                                 universities#index_names
#               universities GET    /universities(.:format)                                       universities#index
#                            POST   /universities(.:format)                                       universities#create
#                 university GET    /universities/:id(.:format)                                   universities#show
#                            PATCH  /universities/:id(.:format)                                   universities#update
#                            PUT    /universities/:id(.:format)                                   universities#update
#                            DELETE /universities/:id(.:format)                                   universities#destroy
#        publications_events GET    /publications_events(.:format)                                publications#index_events
# publications_consultancies GET    /publications_consultancies(.:format)                         publications#index_consultancies
#  publications_publications GET    /publications_publications(.:format)                          publications#index_publications
#                            PATCH  /publications_self/:id(.:format)                              publications#update_self
#                            PUT    /publications_self/:id(.:format)                              publications#update_self
#                            DELETE /publications_self/:id(.:format)                              publications#destroy_self
#               publications GET    /publications(.:format)                                       publications#index
#                            POST   /publications(.:format)                                       publications#create
#                publication GET    /publications/:id(.:format)                                   publications#show
#                            PATCH  /publications/:id(.:format)                                   publications#update
#                            PUT    /publications/:id(.:format)                                   publications#update
#                            DELETE /publications/:id(.:format)                                   publications#destroy
#                            GET    /publications/:publication_id/comments(.:format)              comments#index
#                            GET    /publications/:publication_id/comments/:id(.:format)          comments#show
#                            GET    /publications/:publication_id/comments_truncate/:id(.:format) comments#show_truncate
#                            POST   /publications/:publication_id/comments(.:format)              comments#create
#                            PATCH  /publications/:publication_id/comments_self/:id(.:format)     comments#update_self
#                            PUT    /publications/:publication_id/comments_self/:id(.:format)     comments#update_self
#                            DELETE /publications/:publication_id/comments_self/:id(.:format)     comments#destroy_self
#                            DELETE /publications/:publication_id/comments/:id(.:format)          comments#destroy
#                 users_self GET    /users_self(.:format)                                         users#show_self
#                            PATCH  /users_self(.:format)                                         users#update_self
#                            PUT    /users_self(.:format)                                         users#update_self
#                            DELETE /users_self(.:format)                                         users#destroy_self
#                      users GET    /users(.:format)                                              users#index
#                            POST   /users(.:format)                                              users#create
#                       user GET    /users/:id(.:format)                                          users#show
#                            PATCH  /users/:id(.:format)                                          users#update
#                            PUT    /users/:id(.:format)                                          users#update
#                            DELETE /users/:id(.:format)                                          users#destroy
#                            GET    /projects_self/:id(.:format)                                  projects#show_self
#                            PATCH  /projects_self/:id(.:format)                                  projects#update_self
#                            PUT    /projects_self/:id(.:format)                                  projects#update_self
#                            DELETE /projects_self/:id(.:format)                                  projects#destroy_self
#                   projects GET    /projects(.:format)                                           projects#index
#                            POST   /projects(.:format)                                           projects#create
#                    project GET    /projects/:id(.:format)                                       projects#show
#                            PATCH  /projects/:id(.:format)                                       projects#update
#                            PUT    /projects/:id(.:format)                                       projects#update
#                            DELETE /projects/:id(.:format)                                       projects#destroy
#                            GET    /projects/:project_id/project_documents(.:format)             project_documents#index
#                            GET    /projects/:project_id/project_documents_one(.:format)         project_documents#index_project
#                            GET    /projects/:project_id/project_documents/:id(.:format)         project_documents#show
#                            POST   /projects/:project_id/project_documents(.:format)             project_documents#create
#                            PATCH  /projects/:project_id/project_documents/:id(.:format)         pproject_documents#update
#                            PUT    /projects/:project_id/project_documents/:id(.:format)         project_documents#update
#                            DELETE /projects/:project_id/project_documents/:id(.:format)         project_documents#destroy
#                            GET    /projects/:project_id/project_documents_self(.:format)        project_documents#index_self
#                            GET    /projects/:project_id/project_documents_self/:id(.:format)    project_documents#show_self
#                            PATCH  /projects/:project_id/project_documents_self/:id(.:format)    pproject_documents#update_self
#                            PUT    /projects/:project_id/project_documents_self/:id(.:format)    project_documents#update_self
#                            DELETE /projects/:project_id/project_documents_self/:id(.:format)    project_documents#destroy_self

Rails.application.routes.draw do
  # Crear el token
  post 'user_token' => 'user_token#create'
  
  # Indica a qué usuario pertenece el token generado
  root 'home#index'
  get 'auth' => 'home#auth'

  # Roles
  get 'roles' => 'roles#index'
  get 'roles/:id' => 'roles#show'

  # Document States
  get 'document_states' => 'roles#index'
  get 'document_states/:id' => 'roles#show'

  # Universities
  get 'universities_names' => 'universities#index_names'
  resources :universities

  # Publications
  get 'publications_events' => 'publications#index_events'
  get 'publications_consultancies' => 'publications#index_consultancies'
  get 'publications_publications' => 'publications#index_publications'
  patch 'publications_self/:id' => 'publications#update_self'
  put 'publications_self/:id' => 'publications#update_self'
  delete 'publications_self/:id' => 'publications#destroy_self'
  resources :publications

  # Comments
  get 'publications/:publication_id/comments' => 'comments#index'
  get 'publications/:publication_id/comments/:id' => 'comments#show'
  get 'publications/:publication_id/comments_truncate/:id' => 'comments#show_truncate'
  post 'publications/:publication_id/comments' => 'comments#create'
  patch 'publications/:publication_id/comments_self/:id' => 'comments#update_self'
  put 'publications/:publication_id/comments_self/:id' => 'comments#update_self'
  delete 'publications/:publication_id/comments_self/:id' => 'comments#destroy_self'
  delete 'publications/:publication_id/comments/:id' => 'comments#destroy'

  # Users
  get 'users_self' => 'users#show_self'
  patch 'users_self' => 'users#update_self'
  put 'users_self' => 'users#update_self'
  delete 'users_self' => 'users#destroy_self'
  resources :users

  # Projects
  get 'projects_self/:id' => 'projects#show_self'
  patch 'projects_self/:id' => 'projects#update_self'
  put 'projects_self/:id' => 'projects#update_self'
  delete 'projects_self/:id' => 'projects#destroy_self'
  resources :projects

  #Project Documents
  get 'projects/:project_id/project_documents' => 'project_documents#index'
  get 'projects/:project_id/project_documents_one' => 'project_documents#index_project'
  get 'projects/:project_id/project_documents/:id' => 'project_documents#show'
  post 'projects/:project_id/project_documents' => 'project_documents#create'
  patch 'projects/:project_id/project_documents/:id' => 'pproject_documents#update'
  put 'projects/:project_id/project_documents/:id' => 'project_documents#update'
  delete 'projects/:project_id/project_documents/:id' => 'project_documents#destroy'
  get 'projects/:project_id/project_documents_self' => 'project_documents#index_self'
  get 'projects/:project_id/project_documents_self/:id' => 'project_documents#show_self'
  patch 'projects/:project_id/project_documents_self/:id' => 'pproject_documents#update_self'
  put 'projects/:project_id/project_documents_self/:id' => 'project_documents#update_self'
  delete 'projects/:project_id/project_documents_self/:id' => 'project_documents#destroy_self'
end
