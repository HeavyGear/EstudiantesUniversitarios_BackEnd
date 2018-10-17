# == Schema Information
#
# Table name: publications
#
#  id                  :integer          not null, primary key
#  name                :string
#  description         :text
#  startDate           :datetime
#  endDate             :datetime
#  place               :string
#  latitude            :float
#  longitude           :float
#  user_id             :integer
#  type_publication_id :integer
#  parent_id           :integer
#  children_id         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Publication < ApplicationRecord
    has_many :images, as: :imageable

    has_many :documents, as: :uploadeable

    belongs_to :user

    belongs_to :type_publication

    belongs_to :parent, class_name: 'Publication'
    has_many :children, class_name: 'Publication', foreign_key: 'parent_id'
<<<<<<< HEAD
=======

    validates :name, :description, :place, :type_publication, :user, presence: true
>>>>>>> releases_camilo
end
