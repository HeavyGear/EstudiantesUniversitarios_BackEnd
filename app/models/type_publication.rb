# == Schema Information
#
# Table name: type_publications
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TypePublication < ApplicationRecord
    # Muestra todos los tipos de publicación
    def self.get_type_publications
        self.select('type_publications.id, type_publications.name')
    end

    # Muestra el tipo de publicación solicitado
    def self.get_type_publication(curr_id)
        self.where(id: curr_id).select('type_publications.id, type_publications.name')
    end

    ##
    
    has_many :publications

    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
end
