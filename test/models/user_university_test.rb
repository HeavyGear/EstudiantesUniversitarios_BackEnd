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

require 'test_helper'

class UserUniversityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
