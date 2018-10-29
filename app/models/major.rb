# == Schema Information
#
# Table name: majors
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Major < ApplicationRecord
    # Muestra todas las carreras
    def self.get_majors
        self.select('majors.id, majors.name')
    end

    # Muestra la carrera solicitada
    def self.get_major(curr_id)
        self.where(id: curr_id).select('majors.id, majors.name')
    end

    ##
    
    has_many :user_universities
    has_many :users, through: :user_universities
    has_many :universities, through: :user_universities

    validates :name, presence: true, length: { minimum: 3, maximum: 100 }

end
