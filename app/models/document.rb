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
end
