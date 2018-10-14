class Project < ApplicationRecord
    belongs_to :user, class_name: 'User'
    belongs_to :supervisor, class_name: 'User'

    has_many :project_documents

    belongs_to :project_state
end
