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
    # Muestra todos los estados de documento
    def self.get_document_states
        self.select('document_states.id, document_states.name')
    end

    # Muestra el estado de documento solicitado
    def self.get_document_state(curr_id)
        self.where(id: curr_id).select('document_states.id, document_states.name')
    end

    ##
    
    has_many :project_documents

    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
end
