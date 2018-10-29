# == Schema Information
#
# Table name: user_project_documents
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  project_document_id :integer
#  revisionDate        :datetime
#  comment             :text
#  response            :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class UserProjectDocument < ApplicationRecord
    # Muestra todas las asociaciones entre usuarios y documentos de proyecto
    def self.get_user_project_documents
        self.select('user_project_documents.user_id, user_project_documents.project_document_id, user_project_documents.revisionDate, user_project_documents.comment, user_project_documents.response')
    end

    # Muestra la asociacion entre usuarios y documentos solicitada
    def self.get_user_project_documents(curr_id)
        self.where(id: curr_id).select('user_project_documents.user_id, user_project_documents.project_document_id, user_project_documents.revisionDate, user_project_documents.comment, user_project_documents.response').first
    end

    ##
    
    belongs_to :user
    belongs_to :project_document
    
    validates :user_id , presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates :project_document_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates :comment, presence: true, length: { minimum: 3, maximum: 200 }
    validates :response, length: { minimum: 3, maximum: 200 }
end
