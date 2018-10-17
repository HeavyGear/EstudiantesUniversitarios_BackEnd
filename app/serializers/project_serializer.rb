class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :description, :user_id, :supervisor_id, :project_state_id
end
