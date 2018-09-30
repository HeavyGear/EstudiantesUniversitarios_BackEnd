class UserProjectDocument < ApplicationRecord
  belongs_to :user, foreign_key: 'user'

  belongs_to :project_document, foreign_key: 'projectDocument'
end
