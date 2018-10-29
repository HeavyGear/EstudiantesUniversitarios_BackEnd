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
    # Muestra todos los roles
    def self.get_roles
        self.select('roles.id, roles.name')
    end

    # Muestra el rol solicitado
    def self.get_role(curr_id)
        self.where(id: curr_id).select('roles.id, roles.name')
    end

    ##
    
    has_many :users

    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
end
