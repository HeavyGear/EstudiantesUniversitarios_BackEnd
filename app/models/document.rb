class Document < ApplicationRecord
  belongs_to :uploadeable, polymorphic: true
end
