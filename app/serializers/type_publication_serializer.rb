# == Schema Information
#
# Table name: type_publications
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TypePublicationSerializer < ActiveModel::Serializer
  attributes :id, :name
end
