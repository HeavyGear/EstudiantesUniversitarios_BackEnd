# == Schema Information
#
# Table name: project_documents
#
#  id                :integer          not null, primary key
#  document_state_id :integer
#  project_id        :integer
#  year              :integer
#  period            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ProjectDocument < ApplicationRecord
    # Muestra todos los documentos de un proyecto
    def self.get_project_documents(parent_id)
        self.where(project_id: parent_id).select('project_documents.id, project_documents.document_state_id, project_documents.project_id, project_documents.year, project_documents.period, project_documents.created_at, project_documents.updated_at')
    end

    # Muestra todos los documentos proyectos
    def self.get_all_project_documents()
        self.select('project_documents.id, project_documents.document_state_id, project_documents.project_id, project_documents.year, project_documents.period, project_documents.created_at, project_documents.updated_at')
    end

    # Muestra el documento de proyecto solicitado
    def self.get_project_document(parent_id, project_document_id)
        self.where(project_id: parent_id, id: project_document_id).select('project_documents.id, project_documents.document_state_id, project_documents.project_id, project_documents.year, project_documents.period, project_documents.created_at, project_documents.updated_at').first
    end

    ##
    
    has_many :documents, as: :uploadeable

    belongs_to :project

    validates :document_state_id, presence: true
    validates :project_id, presence: true, numericality: { only_integer: true }
    validates :year, numericality: { minimum: 2010, only_integer: true }
    validates :period, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
end
