# == Schema Information
#
# Table name: type_publications
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TypePublication < ApplicationRecord
    has_many :publications

    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
end
