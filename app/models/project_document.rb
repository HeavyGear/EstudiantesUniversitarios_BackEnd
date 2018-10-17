# == Schema Information
#
# Table name: project_documents
#
#  id                :integer          not null, primary key
#  document_state_id :integer
#  project_id        :integer
#  approved          :boolean
#  year              :integer
#  period            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ProjectDocument < ApplicationRecord
    has_many :documents, as: :uploadeable

<<<<<<< HEAD
    has_many :user_project_documents
    has_many :users, through: :user_project_documents

    belongs_to :project
=======
    has_many :user_project_documents, inverse_of: :project_document
    has_many :users, through: :user_project_documents

    belongs_to :project

    validates :document_state, :project, presence: true
>>>>>>> releases_camilo
end
