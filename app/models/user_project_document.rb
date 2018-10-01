class UserProjectDocument < ApplicationRecord
  belongs_to :user, foreign_key: 'idUser'

  belongs_to :project_document, foreign_key: 'idProjectDocument'
end
