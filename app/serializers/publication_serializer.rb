# == Schema Information
#
# Table name: publications
#
#  id                  :integer          not null, primary key
#  name                :string
#  description         :text
#  startDate           :datetime
#  endDate             :datetime
#  place               :string
#  latitude            :float
#  longitude           :float
#  user_id             :integer
#  type_publication_id :integer
#  parent_id           :integer
#  children_id         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class PublicationSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :startDate, :endDate, :place, :latitude, :longitude, :user_id, :type_publication_id, :parent_id
end
