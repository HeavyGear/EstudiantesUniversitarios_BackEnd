# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ApplicationRecord
    # Muestra todos los proyectos
    def self.get_projects
        self.select('projects.id, projects.name, projects.description, projects.user_id')
    end

    # Muestra el proyecto solicitado
    def self.get_project(curr_id)
        self.where(id: curr_id).select('projects.id, projects.name, projects.description, projects.user_id').first
    end
    
    # Muestra la el proyecto solicitado si fue creado por el usuario con el id asociado
    def self.get_project_self(curr_id, current_user_id)
        self.where(id: curr_id, user_id: current_user_id).select('projects.id, projects.name, projects.description, projects.user_id').first
    end

    ##
    
    belongs_to :user

    has_many :project_documents, dependent: :destroy

    validates :description, :description, presence: true, length: { minimum: 3, maximum: 200 }
    validates :user_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
