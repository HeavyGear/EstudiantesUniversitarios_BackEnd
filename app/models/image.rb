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
  belongs_to :imageable, polymorphic: true
<<<<<<< HEAD
=======
  validates :content, presence: true
>>>>>>> releases_camilo
end
