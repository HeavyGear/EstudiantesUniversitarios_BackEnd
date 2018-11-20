class Comment < ApplicationRecord
    belongs_to :publication

    ##

    validates :body, presence: true, length: { minimum: 3, maximum: 250 }
end
