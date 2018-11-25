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

class ProjectDocumentSerializer < ActiveModel::Serializer
  attributes :id, :document_state_id, :project_id, :year, :period, :created_at, :updated_at
end
