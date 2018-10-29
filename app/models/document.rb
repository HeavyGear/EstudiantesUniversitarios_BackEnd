# == Schema Information
#
# Table name: documents
#
#  id               :integer          not null, primary key
#  content          :string
#  uploadeable_type :string
#  uploadeable_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Document < ApplicationRecord
  mount_uploader :content, DocumentUploader

  belongs_to :uploadeable, polymorphic: true

  belongs_to :document_state
  
  validates :content, presence: true
  validates :uploadeable_type, presence: true, length: { minimum: 3, maximum: 100 }
  validates :uploadeable_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
