# == Schema Information
#
# Table name: publications
#
#  id                  :integer          not null, primary key
#  name                :string
#  description         :text
#  startDate           :datetime
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

    # Muestra todas las publicaciones (sin distinguir tipo)
    def self.get_all_publications
        self.select('publications.id, publications.name, publications.description, publications.startdate, publications.place, publications.latitude, publications.longitude, publications.user_id, publications.type_publication_id')
    end

    # Muestra todos los elementos de tipo evento    
    def self.get_events
        self.where(type_publication_id: 1).select('publications.id, publications.name, publications.description, publications.startdate, publications.place, publications.latitude, publications.longitude, publications.user_id, publications.type_publication_id')
    end

    # Muestra todos los elementos de tipo asesoría
    def self.get_consultancies
        self.where(type_publication_id: 2).select('publications.id, publications.name, publications.description, publications.startdate, publications.place, publications.latitude, publications.longitude, publications.user_id, publications.type_publication_id')
    end

    # Muestra todos los elementos de tipo publicación
    def self.get_publications
        self.where(type_publication_id: 3).select('publications.id, publications.name, publications.description, publications.startdate, publications.place, publications.latitude, publications.longitude, publications.user_id, publications.type_publication_id')
    end

    # Muestra la publicación solicitada
    def self.get_publication(curr_id)
        self.where(id: curr_id).select('publications.id, publications.name, publications.description, publications.startdate publications.place, publications.latitude, publications.longitude, publications.user_id, publications.type_publication_id').first
    end

    # Muestra la publicación solicitada si fue creada por el usuario con el id asociado
    def self.get_publication_self(curr_id, current_user_id)
        self.where(id: curr_id, user_id: current_user_id).select('publications.id, publications.name, publications.description, publications.startdate, publications.endDate, publications.place, publications.latitude, publications.longitude, publications.user_id, publications.type_publication_id').first
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
