class University < ApplicationRecord
    has_many :user_universities
    has_many :users, through: :user_universities
    has_many :majors, through: :user_universities
end
