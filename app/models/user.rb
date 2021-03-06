# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  idnumber        :integer
#  email           :string
#  beneficiary     :boolean
#  password_digest :string
#  role_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    # Muestra todos los usuarios
    def self.get_users
        self.select('users.id, users.name, users.idnumber, users.email, users.password_digest, users.role_id')
    end

    # Muestra el usuario solicitado
    def self.get_user(curr_id)
        self.where(id: curr_id).select('users.id, users.name, users.idnumber, users.email, users.password_digest, users.role_id').first
    end

    # Envía el correo que notifica que se ha creado un usuario
    def self.send_new_user_mail(curr_user)
        UserMailer.new_user(curr_user).deliver
    end

    ##
    
    has_secure_password

    has_many :images, as: :imageable

    has_many :user_universities
    has_many :universities, through: :user_universities
    has_many :majors, through: :user_universities

    belongs_to :role

    has_many :publications

    has_one :project, class_name: 'Project', foreign_key: 'user_id'

    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
    validates :idnumber, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates :role_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

    validates :password, presence: true, length: { minimum: 6 }

    validates :email, presence: true, length: { minimum: 6 }
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end


