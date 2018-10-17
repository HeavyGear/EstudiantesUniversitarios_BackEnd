Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Home controller routes
  root 'home#index'
  get 'auth' => 'home#auth'

  resources :roles do
    resources :users
  end

  resources :majors

  resources :universities

  resources :type_publications

  resources :project_states

  resources :document_states

  resources :users do
    resources :projects do
      resources :project_documents
    end
  end
end
