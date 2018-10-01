class ProjectDocument < ApplicationRecord
    has_one :document, as: :documentable

    belongs_to :document_state, foreign_key: 'idState'

    has_many :user_project_documents
    has_many :users, through: :user_project_documents

    belongs_to :project, foreign_key: 'idProject'
end
