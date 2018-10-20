# == Schema Information
#
# Table name: user_universities
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  university_id :integer
#  major_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class UserUniversity < ApplicationRecord
    belongs_to :user
    belongs_to :university
    belongs_to :major

    
    validates :user, :university, :major, presence: true
end
