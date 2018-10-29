# == Schema Information
#
# Table name: project_states
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectState < ApplicationRecord
    # Muestra todos estados de proyecto
    def self.get_project_states
        self.select('project_states.id, project_states.name')
    end

    # Muestra el estado de proyecto solicitado
    def self.get_project_state(curr_id)
        self.where(id: curr_id).select('project_states.id, project_states.name')
    end

    ##
    
    has_many :projects
    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
end
