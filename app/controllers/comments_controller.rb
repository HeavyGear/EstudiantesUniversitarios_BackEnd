class CommentsController < ApplicationController
    # Filtro que verifica si el usuario está autenticado
    before_action :authenticate_user

    # Filtro que verifica que los únicos con acceso a la información de los comentarios son los administradores
    before_action :verify_role_admin, only: [:destroy]

    ##

    def index
        publication = Publication.get_publication(:publication_id)
        comments = Comment.get_comments(params[:publication_id]).paginate(page: params[:page], per_page: 5)
    
        respond_to do |format|
            format.json { render json: comments, status:200 }
        end
    end

    def create
        publication = Publication.get_publication(params[:id])
        comment = Comment.new(params_comment)
      
        if comment.save
          respond_to do |format|
            format.json { render json: comment, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: comment.errors, status: :unprocessable_entity }
          end
        end
    end
      
    def show
        publication = Publication.get_publication(params[:id])
        comment = Comment.get_comment(params[:publication_id], params[:id])

        respond_to do |format|
          format.json { render json: comment, status:200 }
        end
    end

    def show_truncate
        publication = Publication.get_publication(params[:id])
        comment = Comment.get_comment(params[:publication_id], params[:id])
        comment.body = comment.body.truncate(30)

        respond_to do |format|
          format.json { render json: comment, status:200 }
        end
    end

    def update_self
        publication = Publication.get_publication(params[:id])
        comment = Comment.get_comment(params[:publication_id], params[:id])
      
        if current_user.id == publication.user_id
            if comment.update(params_comment)
                respond_to do |format|
                  format.json { render json: comment, status:200 }
                end
              else
                format.json { render json: comment.errors, status:422 }
              end
        else
            format.json { render json: comment.errors, status:422 }
        end
    end

    def destroy
        publication = Publication.get_publication(params[:id])
        comment = Comment.get_comment(params[:publication_id], params[:id])
      
        comment.destroy
            
        respond_to do |format|
            format.json { render json: comment, status:200 }
        end
    end

    def destroy_self
        publication = Publication.get_publication(params[:id])
        comment = Comment.get_comment(params[:publication_id], params[:id])
      
        if current_user.id == publication.user_id
            comment.destroy
            
            respond_to do |format|
                format.json { render json: comment, status:200 }
            end
        else
            format.json { render json: comment.errors, status:422 }
        end
    end

    ##

    def params_comment
        params.permit(:body, :publication_id)
    end
end
