# == Schema Information
#
# Table name: project_states
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectStateSerializer < ActiveModel::Serializer
  attributes :id, :name
end
