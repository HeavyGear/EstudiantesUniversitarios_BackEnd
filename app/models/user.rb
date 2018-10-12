class User < ApplicationRecord
    has_many :images, as: :imageable

    has_many :user_universities
    has_many :universities, through: :user_universities
end
