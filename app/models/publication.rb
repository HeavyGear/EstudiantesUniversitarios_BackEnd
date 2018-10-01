class Publication < ApplicationRecord
  belongs_to :user, foreign_key: 'idUser'

  has_many :publication_images

  belongs_to :type_publication, foreign_key: 'typePublication'

  #belongs_to :publication, :foreign_key => :parent, optional: true
  #has_many :publications, :foreign_key => :parent, optional: true

  has_many :publication_documents
end
