# == Schema Information
#
# Table name: user_project_documents
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  project_document_id :integer
#  revisionDate        :datetime
#  comment             :text
#  response            :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class UserProjectDocumentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :project_document_id, :revisionDate, :comment, :response
end
