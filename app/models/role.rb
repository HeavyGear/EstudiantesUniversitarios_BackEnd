# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
<<<<<<< HEAD
    has_many :users
=======
    has_many :users, inverse_of: :role
    validates :name, presence: true
>>>>>>> releases_camilo
end
