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
    has_many :users

    # Muestra todos los roles
    def self.get_roles
        self.select('roles.id, roles.name')
    end

    # Muestra todos los usuarios de un rol
    def self.get_users(curr_id)
        self.where(id: curr_id).joins(:users).select('users.id, users.name, users.beneficiary')
    end

    # Muestra el usuario solicitado
    def self.get_user(curr_id)
        self.where(id: curr_id)
    end
end
