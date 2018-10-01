class UserImage < ApplicationRecord
  belongs_to :user, foreign_key: 'idUser'

  has_one :image, as: :imageable
end
