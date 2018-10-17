# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string
#  idNumber    :integer
#  email       :string
#  beneficiary :boolean
#  role_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class User < ApplicationRecord
    has_secure_password

    has_many :images, as: :imageable

    has_many :user_universities
    has_many :universities, through: :user_universities
    has_many :majors, through: :user_universities

    has_many :user_project_documents
    has_many :project_documents, through: :user_project_documents

    belongs_to :role

    has_many :publications

    has_one :project, class_name: 'Project', foreign_key: 'user_id'
    has_many :supervised_projects, class_name: 'Project', foreign_key: 'supervisor_id'

    validates :name, :idNumber, presence: true
    validates :email, presence: true , email: true
    validates :idNumber, presence: true, numericality: true
    validates :role, presence: true
end


