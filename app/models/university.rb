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
<<<<<<< HEAD
    has_many :user_universities
    has_many :users, through: :user_universities
    has_many :majors, through: :user_universities
=======
    has_many :user_universities, inverse_of: :university
    has_many :users, through: :user_universities
    has_many :majors, through: :user_universities

    validates :name, :city, :department, presence: true
>>>>>>> releases_camilo
end
