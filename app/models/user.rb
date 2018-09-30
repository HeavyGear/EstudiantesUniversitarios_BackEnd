class User < ApplicationRecord
  belongs_to :role, foreign_key: 'role'

  has_many :user_major_universities
  has_many :universities, through :user_major_universities
  has_many :majors, through :user_major_universities

  has_one :user_image

  has_many :publications

  has_many :projects

  has_many :user_project_documents
  has_many :project_documents, through :user_project_documents
end
