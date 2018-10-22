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
  mount_uploader :content, ImageUploader

  belongs_to :imageable, polymorphic: true

  validates :content, presence: true
end
