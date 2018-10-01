class Publication < ApplicationRecord
  belongs_to :user, foreign_key: 'idUser'

  has_many :publication_images

  belongs_to :type_publication, foreign_key: 'typePublication'

  has_many :commentaries, class_name: "Publication", foreign_key: "parent"
  belongs_to :publication, class_name: "Publication"

  has_many :publication_documents
end
