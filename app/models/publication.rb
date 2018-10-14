class Publication < ApplicationRecord
    has_many :images, as: :imageable

    has_many :documents, as: :uploadeable

    belongs_to :user

    belongs_to :type_publication

    belongs_to :parent, class_name: 'Publication'
    has_many :children, class_name: 'Publication', foreign_key: 'parent_id'
end
