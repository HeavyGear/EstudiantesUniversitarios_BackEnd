class UserProjectDocumentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :project_document_id, :revisionDate, :comment, :response
end
