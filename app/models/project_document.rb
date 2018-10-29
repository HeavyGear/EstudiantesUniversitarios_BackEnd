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
    
    has_many :user_project_documents
    has_many :users, through: :user_project_documents

    belongs_to :project

    belongs_to :project_document

    validates :document_state_id, presence: true
    validates :project_id, presence: true, numericality: { only_integer: true }
    validates :year, numericality: { minimum: 2010 }, numericality: { only_integer: true }
    validates :period, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
end
