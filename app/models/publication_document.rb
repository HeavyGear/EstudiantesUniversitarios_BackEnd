class PublicationDocument < ApplicationRecord
  #belongs_to :publication, foreign_key: 'publication'

  #has_one :document, as: :documentable

  #has_many :user_project_documents
  #has_many :users, through :user_project_documents
end
