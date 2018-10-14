class UserUniversity < ApplicationRecord
    belongs_to :user
    belongs_to :university
    belongs_to :major
end
