# == Schema Information
#
# Table name: projects
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :text
#  user_id          :integer
#  supervisor_id    :integer
#  project_state_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Project < ApplicationRecord
    belongs_to :user, class_name: 'User'
    belongs_to :supervisor, class_name: 'User'

    has_many :project_documents

    belongs_to :project_state
end
