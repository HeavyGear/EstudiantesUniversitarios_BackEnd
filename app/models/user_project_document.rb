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

class UserProjectDocument < ApplicationRecord
    belongs_to :user
    belongs_to :project_document
    
    validates :user, :project_document, presence: true
end
