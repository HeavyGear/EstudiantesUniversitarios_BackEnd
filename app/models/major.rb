# == Schema Information
#
# Table name: majors
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Major < ApplicationRecord
    has_many :user_universities
    has_many :users, through: :user_universities
    has_many :universities, through: :user_universities
end
