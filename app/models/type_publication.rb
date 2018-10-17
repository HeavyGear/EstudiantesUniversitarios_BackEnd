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
    has_many :publications,  inverse_of: :type_publication
    validates :name, presence: true
end
