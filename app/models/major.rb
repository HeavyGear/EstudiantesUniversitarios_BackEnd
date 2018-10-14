class Major < ApplicationRecord
    has_many :user_universities
    has_many :users, through: :user_universities
    has_many :universities, through: :user_universities
end
