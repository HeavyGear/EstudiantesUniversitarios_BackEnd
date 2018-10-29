# == Schema Information
#
# Table name: publications
#
#  id                  :integer          not null, primary key
#  name                :string
#  description         :text
#  startDate           :datetime
#  endDate             :datetime
#  place               :string
#  latitude            :float
#  longitude           :float
#  user_id             :integer
#  type_publication_id :integer
#  parent_id           :integer
#  children_id         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Publication < ApplicationRecord
    # Muestra todas las publicaciones
    def self.get_publications
        self.select('publications.id, publications.name, publications.description, publications.startDate, publications.endDate, publications.place, publications.latitude, publications.longitude, publications.user_id, publications.type_publication_id, publications.parent_id')
    end

    # Muestra la publicación solicitada
    def self.get_publication(curr_id)
        self.where(id: curr_id).select('publications.id, publications.name, publications.description, publications.startDate, publications.endDate, publications.place, publications.latitude, publications.longitude, publications.user_id, publications.type_publication_id, publications.parent_id').first
    end

    ##
    
    has_many :images, as: :imageable

    has_many :documents, as: :uploadeable

    belongs_to :user

    belongs_to :type_publication

    belongs_to :parent, class_name: 'Publication'
    has_many :children, class_name: 'Publication', foreign_key: 'parent_id'

    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
    validates :description, presence: true, length: { minimum: 3, maximum: 200 }
    validates :place, presence: true, length: { minimum: 3, maximum: 100 }
    validates :type_publication_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates :user_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates :parent_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
