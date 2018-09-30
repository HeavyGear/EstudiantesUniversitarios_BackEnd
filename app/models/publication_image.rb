class PublicationImage < ApplicationRecord
  has_one :images, as: :imageable, foreign_key: 'image'

  belongs_to :publication, foreign_key: 'publication'
end
