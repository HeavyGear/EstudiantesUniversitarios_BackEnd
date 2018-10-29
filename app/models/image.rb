# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  content        :string
#  imageable_type :string
#  imageable_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Image < ApplicationRecord
  # Muestra todas las imágenes
  def self.get_images
    self.select('images.id, images.content, images.imageable_type, images.imageable_id')
  end

  # Muestra la imagen solicitada
  def self.get_image(curr_id)
      self.where(id: curr_id).select('images.id, images.content, images.imageable_type, images.imageable_id')
  end

  ##

  mount_uploader :content, ImageUploader

  belongs_to :imageable, polymorphic: true

  validates :content, presence: true
  validates :imageable_type, presence: true, length: { minimum: 3, maximum: 100 }
  validates :imageable_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
