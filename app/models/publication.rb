class Publication < ApplicationRecord
    has_many :images, as: :imageable

    has_many :documents, as: :uploadeable
end
