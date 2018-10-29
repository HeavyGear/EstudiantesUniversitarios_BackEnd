# == Schema Information
#
# Table name: universities
#
#  id         :integer          not null, primary key
#  name       :string
#  city       :string
#  department :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class University < ApplicationRecord
    # Muestra todas las universidades
    def self.get_universities
        self.select('universities.id, universities.name, universities.city, universities.department')
    end

    # Muestra la universidad solicitada
    def self.get_university(curr_id)
        self.where(id: curr_id).select('universities.id, universities.name, universities.city, universities.department')
    end

    ##

    has_many :user_universities
    has_many :users, through: :user_universities
    has_many :majors, through: :user_universities

    has_one :image, as: :imageable

    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
    validates  :city, presence: true, length: { minimum: 3, maximum: 100 }
    validates :department, presence: true, length: { minimum: 3, maximum: 100 }
end
