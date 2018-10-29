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
    # Muestra todos los proyectos
    def self.get_projects
        self.select('projects.id, projects.name, projects.description, projects.user_id, projects.supervisor_id, projects.project_state_id')
    end

    # Muestra el proyecto solicitado
    def self.get_project(curr_id)
        self.where(id: curr_id).select('projects.id, projects.name, projects.description, projects.user_id, projects.supervisor_id, projects.project_state_id').first
    end

    ##
    
    belongs_to :user, class_name: 'User'
    belongs_to :supervisor, class_name: 'User'

    has_many :project_documents

    belongs_to :project_state

    validates :project_state, :name, :description, presence: true, length: { minimum: 3, maximum: 100 }
    validates :description, :description, presence: true, length: { minimum: 3, maximum: 200 }
    validates :user_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates :supervisor_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates :project_state_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
