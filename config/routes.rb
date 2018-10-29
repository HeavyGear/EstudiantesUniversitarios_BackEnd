# == Route Map
#
#                                       Prefix Verb   URI Pattern                                                                                 Controller#Action
#                                   user_token POST   /user_token(.:format)                                                                       user_token#create
#                                         root GET    /                                                                                           home#index
#                                         auth GET    /auth(.:format)                                                                             home#auth
#                                   role_users GET    /roles/:role_id/users(.:format)                                                             users#index
#                                              POST   /roles/:role_id/users(.:format)                                                             users#create
#                                    role_user GET    /roles/:role_id/users/:id(.:format)                                                         users#show
#                                              PATCH  /roles/:role_id/users/:id(.:format)                                                         users#update
#                                              PUT    /roles/:role_id/users/:id(.:format)                                                         users#update
#                                              DELETE /roles/:role_id/users/:id(.:format)                                                         users#destroy
#                                        roles GET    /roles(.:format)                                                                            roles#index
#                                              POST   /roles(.:format)                                                                            roles#create
#                                         role GET    /roles/:id(.:format)                                                                        roles#show
#                                              PATCH  /roles/:id(.:format)                                                                        roles#update
#                                              PUT    /roles/:id(.:format)                                                                        roles#update
#                                              DELETE /roles/:id(.:format)                                                                        roles#destroy
#                                  major_users GET    /majors/:major_id/users(.:format)                                                           users#index
#                                              POST   /majors/:major_id/users(.:format)                                                           users#create
#                                   major_user GET    /majors/:major_id/users/:id(.:format)                                                       users#show
#                                              PATCH  /majors/:major_id/users/:id(.:format)                                                       users#update
#                                              PUT    /majors/:major_id/users/:id(.:format)                                                       users#update
#                                              DELETE /majors/:major_id/users/:id(.:format)                                                       users#destroy
#                           major_universities GET    /majors/:major_id/universities(.:format)                                                    universities#index
#                                              POST   /majors/:major_id/universities(.:format)                                                    universities#create
#                             major_university GET    /majors/:major_id/universities/:id(.:format)                                                universities#show
#                                              PATCH  /majors/:major_id/universities/:id(.:format)                                                universities#update
#                                              PUT    /majors/:major_id/universities/:id(.:format)                                                universities#update
#                                              DELETE /majors/:major_id/universities/:id(.:format)                                                universities#destroy
#                                       majors GET    /majors(.:format)                                                                           majors#index
#                                              POST   /majors(.:format)                                                                           majors#create
#                                        major GET    /majors/:id(.:format)                                                                       majors#show
#                                              PATCH  /majors/:id(.:format)                                                                       majors#update
#                                              PUT    /majors/:id(.:format)                                                                       majors#update
#                                              DELETE /majors/:id(.:format)                                                                       majors#destroy
#                             university_users GET    /universities/:university_id/users(.:format)                                                users#index
#                                              POST   /universities/:university_id/users(.:format)                                                users#create
#                              university_user GET    /universities/:university_id/users/:id(.:format)                                            users#show
#                                              PATCH  /universities/:university_id/users/:id(.:format)                                            users#update
#                                              PUT    /universities/:university_id/users/:id(.:format)                                            users#update
#                                              DELETE /universities/:university_id/users/:id(.:format)                                            users#destroy
#                            university_majors GET    /universities/:university_id/majors(.:format)                                               majors#index
#                                              POST   /universities/:university_id/majors(.:format)                                               majors#create
#                             university_major GET    /universities/:university_id/majors/:id(.:format)                                           majors#show
#                                              PATCH  /universities/:university_id/majors/:id(.:format)                                           majors#update
#                                              PUT    /universities/:university_id/majors/:id(.:format)                                           majors#update
#                                              DELETE /universities/:university_id/majors/:id(.:format)                                           majors#destroy
#                            university_images GET    /universities/:university_id/images(.:format)                                               images#index
#                                              POST   /universities/:university_id/images(.:format)                                               images#create
#                             university_image GET    /universities/:university_id/images/:id(.:format)                                           images#show
#                                              PATCH  /universities/:university_id/images/:id(.:format)                                           images#update
#                                              PUT    /universities/:university_id/images/:id(.:format)                                           images#update
#                                              DELETE /universities/:university_id/images/:id(.:format)                                           images#destroy
#                                 universities GET    /universities(.:format)                                                                     universities#index
#                                              POST   /universities(.:format)                                                                     universities#create
#                                   university GET    /universities/:id(.:format)                                                                 universities#show
#                                              PATCH  /universities/:id(.:format)                                                                 universities#update
#                                              PUT    /universities/:id(.:format)                                                                 universities#update
#                                              DELETE /universities/:id(.:format)                                                                 universities#destroy
#                                user_projects GET    /users/:user_id/projects(.:format)                                                          projects#index
#                                              POST   /users/:user_id/projects(.:format)                                                          projects#create
#                                 user_project GET    /users/:user_id/projects/:id(.:format)                                                      projects#show
#                                              PATCH  /users/:user_id/projects/:id(.:format)                                                      projects#update
#                                              PUT    /users/:user_id/projects/:id(.:format)                                                      projects#update
#                                              DELETE /users/:user_id/projects/:id(.:format)                                                      projects#destroy
#                                  user_images GET    /users/:user_id/images(.:format)                                                            images#index
#                                              POST   /users/:user_id/images(.:format)                                                            images#create
#                                   user_image GET    /users/:user_id/images/:id(.:format)                                                        images#show
#                                              PATCH  /users/:user_id/images/:id(.:format)                                                        images#update
#                                              PUT    /users/:user_id/images/:id(.:format)                                                        images#update
#                                              DELETE /users/:user_id/images/:id(.:format)                                                        images#destroy
#                            user_universities GET    /users/:user_id/universities(.:format)                                                      universities#index
#                                              POST   /users/:user_id/universities(.:format)                                                      universities#create
#                              user_university GET    /users/:user_id/universities/:id(.:format)                                                  universities#show
#                                              PATCH  /users/:user_id/universities/:id(.:format)                                                  universities#update
#                                              PUT    /users/:user_id/universities/:id(.:format)                                                  universities#update
#                                              DELETE /users/:user_id/universities/:id(.:format)                                                  universities#destroy
#                                  user_majors GET    /users/:user_id/majors(.:format)                                                            majors#index
#                                              POST   /users/:user_id/majors(.:format)                                                            majors#create
#                                   user_major GET    /users/:user_id/majors/:id(.:format)                                                        majors#show
#                                              PATCH  /users/:user_id/majors/:id(.:format)                                                        majors#update
#                                              PUT    /users/:user_id/majors/:id(.:format)                                                        majors#update
#                                              DELETE /users/:user_id/majors/:id(.:format)                                                        majors#destroy
#                            user_publications GET    /users/:user_id/publications(.:format)                                                      publications#index
#                                              POST   /users/:user_id/publications(.:format)                                                      publications#create
#                             user_publication GET    /users/:user_id/publications/:id(.:format)                                                  publications#show
#                                              PATCH  /users/:user_id/publications/:id(.:format)                                                  publications#update
#                                              PUT    /users/:user_id/publications/:id(.:format)                                                  publications#update
#                                              DELETE /users/:user_id/publications/:id(.:format)                                                  publications#destroy
# user_project_document_user_project_documents GET    /users/:user_id/project_documents/:project_document_id/user_project_documents(.:format)     user_project_documents#index
#                                              POST   /users/:user_id/project_documents/:project_document_id/user_project_documents(.:format)     user_project_documents#create
#  user_project_document_user_project_document GET    /users/:user_id/project_documents/:project_document_id/user_project_documents/:id(.:format) user_project_documents#show
#                                              PATCH  /users/:user_id/project_documents/:project_document_id/user_project_documents/:id(.:format) user_project_documents#update
#                                              PUT    /users/:user_id/project_documents/:project_document_id/user_project_documents/:id(.:format) user_project_documents#update
#                                              DELETE /users/:user_id/project_documents/:project_document_id/user_project_documents/:id(.:format) user_project_documents#destroy
#                       user_project_documents GET    /users/:user_id/project_documents(.:format)                                                 project_documents#index
#                                              POST   /users/:user_id/project_documents(.:format)                                                 project_documents#create
#                        user_project_document GET    /users/:user_id/project_documents/:id(.:format)                                             project_documents#show
#                                              PATCH  /users/:user_id/project_documents/:id(.:format)                                             project_documents#update
#                                              PUT    /users/:user_id/project_documents/:id(.:format)                                             project_documents#update
#                                              DELETE /users/:user_id/project_documents/:id(.:format)                                             project_documents#destroy
#                                        users GET    /users(.:format)                                                                            users#index
#                                              POST   /users(.:format)                                                                            users#create
#                                         user GET    /users/:id(.:format)                                                                        users#show
#                                              PATCH  /users/:id(.:format)                                                                        users#update
#                                              PUT    /users/:id(.:format)                                                                        users#update
#                                              DELETE /users/:id(.:format)                                                                        users#destroy
#                   project_document_documents GET    /project_documents/:project_document_id/documents(.:format)                                 documents#index
#                                              POST   /project_documents/:project_document_id/documents(.:format)                                 documents#create
#                    project_document_document GET    /project_documents/:project_document_id/documents/:id(.:format)                             documents#show
#                                              PATCH  /project_documents/:project_document_id/documents/:id(.:format)                             documents#update
#                                              PUT    /project_documents/:project_document_id/documents/:id(.:format)                             documents#update
#                                              DELETE /project_documents/:project_document_id/documents/:id(.:format)                             documents#destroy
# project_document_user_user_project_documents GET    /project_documents/:project_document_id/users/:user_id/user_project_documents(.:format)     user_project_documents#index
#                                              POST   /project_documents/:project_document_id/users/:user_id/user_project_documents(.:format)     user_project_documents#create
#  project_document_user_user_project_document GET    /project_documents/:project_document_id/users/:user_id/user_project_documents/:id(.:format) user_project_documents#show
#                                              PATCH  /project_documents/:project_document_id/users/:user_id/user_project_documents/:id(.:format) user_project_documents#update
#                                              PUT    /project_documents/:project_document_id/users/:user_id/user_project_documents/:id(.:format) user_project_documents#update
#                                              DELETE /project_documents/:project_document_id/users/:user_id/user_project_documents/:id(.:format) user_project_documents#destroy
#                       project_document_users GET    /project_documents/:project_document_id/users(.:format)                                     users#index
#                                              POST   /project_documents/:project_document_id/users(.:format)                                     users#create
#                        project_document_user GET    /project_documents/:project_document_id/users/:id(.:format)                                 users#show
#                                              PATCH  /project_documents/:project_document_id/users/:id(.:format)                                 users#update
#                                              PUT    /project_documents/:project_document_id/users/:id(.:format)                                 users#update
#                                              DELETE /project_documents/:project_document_id/users/:id(.:format)                                 users#destroy
#                            project_documents GET    /project_documents(.:format)                                                                project_documents#index
#                                              POST   /project_documents(.:format)                                                                project_documents#create
#                             project_document GET    /project_documents/:id(.:format)                                                            project_documents#show
#                                              PATCH  /project_documents/:id(.:format)                                                            project_documents#update
#                                              PUT    /project_documents/:id(.:format)                                                            project_documents#update
#                                              DELETE /project_documents/:id(.:format)                                                            project_documents#destroy
#                    project_project_documents GET    /projects/:project_id/project_documents(.:format)                                           project_documents#index
#                                              POST   /projects/:project_id/project_documents(.:format)                                           project_documents#create
#                     project_project_document GET    /projects/:project_id/project_documents/:id(.:format)                                       project_documents#show
#                                              PATCH  /projects/:project_id/project_documents/:id(.:format)                                       project_documents#update
#                                              PUT    /projects/:project_id/project_documents/:id(.:format)                                       project_documents#update
#                                              DELETE /projects/:project_id/project_documents/:id(.:format)                                       project_documents#destroy
#                                     projects GET    /projects(.:format)                                                                         projects#index
#                                              POST   /projects(.:format)                                                                         projects#create
#                                      project GET    /projects/:id(.:format)                                                                     projects#show
#                                              PATCH  /projects/:id(.:format)                                                                     projects#update
#                                              PUT    /projects/:id(.:format)                                                                     projects#update
#                                              DELETE /projects/:id(.:format)                                                                     projects#destroy
#                       project_state_projects GET    /project_states/:project_state_id/projects(.:format)                                        projects#index
#                                              POST   /project_states/:project_state_id/projects(.:format)                                        projects#create
#                        project_state_project GET    /project_states/:project_state_id/projects/:id(.:format)                                    projects#show
#                                              PATCH  /project_states/:project_state_id/projects/:id(.:format)                                    projects#update
#                                              PUT    /project_states/:project_state_id/projects/:id(.:format)                                    projects#update
#                                              DELETE /project_states/:project_state_id/projects/:id(.:format)                                    projects#destroy
#                               project_states GET    /project_states(.:format)                                                                   project_states#index
#                                              POST   /project_states(.:format)                                                                   project_states#create
#                                project_state GET    /project_states/:id(.:format)                                                               project_states#show
#                                              PATCH  /project_states/:id(.:format)                                                               project_states#update
#                                              PUT    /project_states/:id(.:format)                                                               project_states#update
#                                              DELETE /project_states/:id(.:format)                                                               project_states#destroy
#             document_state_project_documents GET    /document_states/:document_state_id/project_documents(.:format)                             project_documents#index
#                                              POST   /document_states/:document_state_id/project_documents(.:format)                             project_documents#create
#              document_state_project_document GET    /document_states/:document_state_id/project_documents/:id(.:format)                         project_documents#show
#                                              PATCH  /document_states/:document_state_id/project_documents/:id(.:format)                         project_documents#update
#                                              PUT    /document_states/:document_state_id/project_documents/:id(.:format)                         project_documents#update
#                                              DELETE /document_states/:document_state_id/project_documents/:id(.:format)                         project_documents#destroy
#                              document_states GET    /document_states(.:format)                                                                  document_states#index
#                                              POST   /document_states(.:format)                                                                  document_states#create
#                               document_state GET    /document_states/:id(.:format)                                                              document_states#show
#                                              PATCH  /document_states/:id(.:format)                                                              document_states#update
#                                              PUT    /document_states/:id(.:format)                                                              document_states#update
#                                              DELETE /document_states/:id(.:format)                                                              document_states#destroy
#                type_publication_publications GET    /type_publications/:type_publication_id/publications(.:format)                              publications#index
#                                              POST   /type_publications/:type_publication_id/publications(.:format)                              publications#create
#                 type_publication_publication GET    /type_publications/:type_publication_id/publications/:id(.:format)                          publications#show
#                                              PATCH  /type_publications/:type_publication_id/publications/:id(.:format)                          publications#update
#                                              PUT    /type_publications/:type_publication_id/publications/:id(.:format)                          publications#update
#                                              DELETE /type_publications/:type_publication_id/publications/:id(.:format)                          publications#destroy
#                            type_publications GET    /type_publications(.:format)                                                                type_publications#index
#                                              POST   /type_publications(.:format)                                                                type_publications#create
#                             type_publication GET    /type_publications/:id(.:format)                                                            type_publications#show
#                                              PATCH  /type_publications/:id(.:format)                                                            type_publications#update
#                                              PUT    /type_publications/:id(.:format)                                                            type_publications#update
#                                              DELETE /type_publications/:id(.:format)                                                            type_publications#destroy
#                           publication_images GET    /publications/:publication_id/images(.:format)                                              images#index
#                                              POST   /publications/:publication_id/images(.:format)                                              images#create
#                            publication_image GET    /publications/:publication_id/images/:id(.:format)                                          images#show
#                                              PATCH  /publications/:publication_id/images/:id(.:format)                                          images#update
#                                              PUT    /publications/:publication_id/images/:id(.:format)                                          images#update
#                                              DELETE /publications/:publication_id/images/:id(.:format)                                          images#destroy
#                        publication_documents GET    /publications/:publication_id/documents(.:format)                                           documents#index
#                                              POST   /publications/:publication_id/documents(.:format)                                           documents#create
#                         publication_document GET    /publications/:publication_id/documents/:id(.:format)                                       documents#show
#                                              PATCH  /publications/:publication_id/documents/:id(.:format)                                       documents#update
#                                              PUT    /publications/:publication_id/documents/:id(.:format)                                       documents#update
#                                              DELETE /publications/:publication_id/documents/:id(.:format)                                       documents#destroy
#                                 publications GET    /publications(.:format)                                                                     publications#index
#                                              POST   /publications(.:format)                                                                     publications#create
#                                  publication GET    /publications/:id(.:format)                                                                 publications#show
#                                              PATCH  /publications/:id(.:format)                                                                 publications#update
#                                              PUT    /publications/:id(.:format)                                                                 publications#update
#                                              DELETE /publications/:id(.:format)                                                                 publications#destroy

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

    resources :publications

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
