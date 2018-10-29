# == Schema Information
#
# Table name: document_states
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DocumentStateSerializer < ActiveModel::Serializer
  attributes :id, :name
end
