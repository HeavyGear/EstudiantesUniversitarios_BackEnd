class Project < ApplicationRecord
  belongs_to :user, foreign_key: 'supervisor'
  belongs_to :user, foreign_key: 'idUser'

  belongs_to :project_state, foreign_key: 'idState'

  has_many :project_documents
end
