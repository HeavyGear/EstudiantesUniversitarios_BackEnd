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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
