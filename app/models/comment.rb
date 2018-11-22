# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  body           :text
#  publication_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Comment < ApplicationRecord
    belongs_to :publication

    ##

    validates :body, presence: true, length: { minimum: 3, maximum: 250 }
end
