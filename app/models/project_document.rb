class ProjectDocument < ApplicationRecord
    has_many :documents, as: :uploadeable

    has_many :user_project_documents
    has_many :users, through: :user_project_documents
end
