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
    has_many :user_universities
    has_many :users, through: :user_universities
    has_many :majors, through: :user_universities

    has_one :image, as: :imageable

    validates :name, , presence: true, length: { minimum: 3, maximum: 100 }
    validates  :city, , presence: true, length: { minimum: 3, maximum: 100 }
    validates :department, , presence: true, length: { minimum: 3, maximum: 100 }
end
