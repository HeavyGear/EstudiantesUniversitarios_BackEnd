# == Schema Information
#
# Table name: projects
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :text
#  user_id          :integer
#  supervisor_id    :integer
#  project_state_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :description, :user_id, :project_state_id
end
