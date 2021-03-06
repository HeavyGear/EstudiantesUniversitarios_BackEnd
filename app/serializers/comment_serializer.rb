# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  body           :text
#  publication_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :username, :publication_id
end
