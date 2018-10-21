class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :content, :uploadeable_id, :uploadeable_type
end
