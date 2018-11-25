# == Schema Information
#
# Table name: project_documents
#
#  id                :integer          not null, primary key
#  document_state_id :integer
#  project_id        :integer
#  year              :integer
#  period            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ProjectDocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
