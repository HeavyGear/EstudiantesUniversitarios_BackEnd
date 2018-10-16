class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :description, :user_id, :supervisor_id, :project_state_id
  has_many :project_documents
  config.embed :ids, incude: true
end
