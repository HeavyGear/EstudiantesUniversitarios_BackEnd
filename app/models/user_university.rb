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

    
    validates :user_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates :university_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates  :major_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
