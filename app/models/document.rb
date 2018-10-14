class Document < ApplicationRecord
  belongs_to :uploadeable, polymorphic: true

  belongs_to :document_state
end
