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
    # Muestra todos los comentarios asociados a una publicación
    def self.get_comments(parent_id)
        self.where(publication_id: parent_id).select('comments.id, comments.body, comments.username, comments.publication_id, comments.created_at')
    end

    # Muestra el comentario solicitado que esté asociado a una publicación
    def self.get_comment(parent_id, comment_id)
        self.where(publication_id: parent_id, id: comment_id).select('comments.id, comments.body, comments.username, comments.publication_id, comments.created_at').first
    end

    ##


    belongs_to :publication

    ##

    validates :body, presence: true, length: { minimum: 3, maximum: 250 }
    validates :publication_id, presence: true, numericality: { only_integer: true }
    validates :username, presence: true, length: { minimum: 3, maximum: 60 }
end
