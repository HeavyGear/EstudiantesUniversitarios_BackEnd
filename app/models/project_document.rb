class ProjectDocument < ApplicationRecord
    has_many :documents, as: :uploadeable
end
