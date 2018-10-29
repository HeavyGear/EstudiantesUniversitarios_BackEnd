# == Schema Information
#
# Table name: user_universities
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  university_id :integer
#  major_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class UserUniversitySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :university_id, :major_id
end
