class UserMajorUniversity < ApplicationRecord
  belongs_to :user, foreign_key: 'idUser'

  belongs_to :university, foreign_key: 'idUniversity'

  belongs_to :major, foreign_key: 'idMajor'
end
