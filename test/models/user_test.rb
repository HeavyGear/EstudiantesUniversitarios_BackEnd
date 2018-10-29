# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  idnumber        :integer
#  email           :string
#  beneficiary     :boolean
#  password_digest :string
#  role_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
