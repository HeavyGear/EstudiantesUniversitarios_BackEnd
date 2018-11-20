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
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Publication < ApplicationRecord
    #after_save :send_new_publication_mail

    ##

    # Muestra todas las publicaciones
    def self.get_publications
        self.select('publications.id, publications.name, publications.description, publications.startDate, publications.endDate, publications.place, publications.latitude, publications.longitude, publications.user_id, publications.type_publication_id, publications.parent_id')
    end

    # Muestra la publicación solicitada
    def self.get_publication(curr_id)
        self.where(id: curr_id).select('publications.id, publications.name, publications.description, publications.startDate, publications.endDate, publications.place, publications.latitude, publications.longitude, publications.user_id, publications.type_publication_id, publications.parent_id').first
    end

    # Envía el correo que notifica que se ha creado una publicación
    def self.send_new_publication_mail(curr_publication)
        PublicationMailer.new_publication(curr_publication).deliver
    end

    ##
    
    has_many :images, as: :imageable

    has_many :documents, as: :uploadeable

    has_many :comments

    belongs_to :user

    belongs_to :type_publication

    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
    validates :description, presence: true, length: { minimum: 3, maximum: 200 }
    validates :place, presence: true, length: { minimum: 3, maximum: 100 }
    validates :type_publication_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates :user_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
