# == Schema Information
#
# Table name: document_states
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DocumentState < ApplicationRecord
<<<<<<< HEAD
    has_many :project_documents
=======
    has_many :project_documents
    validates :name, presence: true
>>>>>>> releases_camilo
end
