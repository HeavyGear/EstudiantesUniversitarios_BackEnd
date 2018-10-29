# == Schema Information
#
# Table name: documents
#
#  id               :integer          not null, primary key
#  content          :string
#  uploadeable_type :string
#  uploadeable_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :content, :uploadeable_id, :uploadeable_type
end
