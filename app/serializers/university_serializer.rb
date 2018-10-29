# == Schema Information
#
# Table name: universities
#
#  id         :integer          not null, primary key
#  name       :string
#  city       :string
#  department :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UniversitySerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :department
end
