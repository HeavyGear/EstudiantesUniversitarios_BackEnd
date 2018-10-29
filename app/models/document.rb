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
  # Muestra todos los documentos
  def self.get_documents
      self.select('documents.id, documents.content, documents.uploadeable_type, documents.uploadeable_id')
  end

  # Muestra el documento solicitado
  def self.get_document(curr_id)
      self.where(id: curr_id).select('documents.id, documents.content, documents.uploadeable_type, documents.uploadeable_id').first
  end

  ##
  
  mount_uploader :content, DocumentUploader

  belongs_to :uploadeable, polymorphic: true

  belongs_to :document_state
  
  validates :content, presence: true
  validates :uploadeable_type, presence: true, length: { minimum: 3, maximum: 100 }
  validates :uploadeable_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
