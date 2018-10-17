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

<<<<<<< HEAD
class User < ApplicationRecord
=======
class User < ApplicationRecord::Base
>>>>>>> releases_camilo
    has_secure_password

    has_many :images, as: :imageable

<<<<<<< HEAD
    has_many :user_universities
    has_many :universities, through: :user_universities
    has_many :majors, through: :user_universities

    has_many :user_project_documents
=======
    has_many :user_universities, inverse_of: :university
    has_many :universities, through: :user_universities
    has_many :majors, through: :user_universities

    has_many :user_project_documents, inverse_of: :user
>>>>>>> releases_camilo
    has_many :project_documents, through: :user_project_documents

    belongs_to :role

<<<<<<< HEAD
    has_many :publications

    has_one :project, class_name: 'Project', foreign_key: 'user_id'
    has_many :supervised_projects, class_name: 'Project', foreign_key: 'supervisor_id'
=======
    has_many :publications, inverse_of: :user

    has_one :project, class_name: 'Project', foreign_key: 'user_id'
    has_many :supervised_projects, class_name: 'Project', foreign_key: 'supervisor_id'

    validates :name, :idNumber, presence: true
    validates :email, presence: true , email: true
    validates :idNumber, presence: true, numericality: true
    validates :role, presence: true
end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
>>>>>>> releases_camilo
end
