class Major < ApplicationRecord
  has_many :user_major_universities
  has_many :universities, through :user_major_universities
  has_many :users, through :user_major_universities
end
