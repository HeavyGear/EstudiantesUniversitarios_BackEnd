class University < ApplicationRecord
  has_many :user_major_universities
  has_many :users, through: :user_major_universities
  has_many :majors, through: :user_major_universities
end
