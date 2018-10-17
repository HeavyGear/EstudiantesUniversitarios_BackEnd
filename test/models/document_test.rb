# == Schema Information
#
# Table name: documents
#
#  id               :integer          not null, primary key
#  content          :string
#  uploadeable_type :string
#  uploadeable_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
