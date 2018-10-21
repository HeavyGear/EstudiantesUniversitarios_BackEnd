class PublicationSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :startDate, :endDate, :place, :latitude, 
  :longitude, :user_id, :type_publication_id, :parent_id, :children_id
end
