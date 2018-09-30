class UserImage < ApplicationRecord
  belongs_to :user, foreign_key: 'user'

  has_one :image, as: :imageable, foreign_key: 'image'
end
