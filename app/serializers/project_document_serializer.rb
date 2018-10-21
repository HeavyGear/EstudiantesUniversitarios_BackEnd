class ProjectDocumentSerializer < ActiveModel::Serializer
  attributes :id, :document_state_id, :project_id, :approved, :year, period
end
