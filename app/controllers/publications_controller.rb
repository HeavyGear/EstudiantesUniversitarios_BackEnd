class PublicationsController < ApplicationController
  # Filtro que verifica si el usuario está autenticado
  before_action :authenticate_user

  # Filtro que verifica que los únicos con acceso a la información de las universidades son los administradores
  before_action :verify_role_admin, only: [:destroy]

  # Filtro que verifica que los únicos con acceso a la información de las universidades son los usuarios
  before_action :verify_role_user, only: [:destroy_self] 

  ##

    def index
        publications = Publication.get_all_publications.paginate(page: params[:page], per_page: 10)
    
        respond_to do |format|
          format.json { render json: publications, status:200 }
        end
    end

    def index_events
      publications = Publication.get_events.paginate(page: params[:page], per_page: 10)
  
      respond_to do |format|
        format.json { render json: publications, status:200 }
      end
    end

    def index_consultancies
      publications = Publication.get_consultancies.paginate(page: params[:page], per_page: 10)
  
      respond_to do |format|
        format.json { render json: publications, status:200 }
      end
    end

    def index_publications
      publications = Publication.get_publications.paginate(page: params[:page], per_page: 10)
  
      respond_to do |format|
        format.json { render json: publications, status:200 }
      end
    end
      
    def create
        publication = Publication.new(params_publication)
      
        if publication.save
          Publication.send_new_publication_mail(publication)

          respond_to do |format|
            format.json { render json: publication, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: publication.errors, status: :unprocessable_entity }
          end
        end
    end

    def create_by_type_id
      publication = Publication.new(params_publication)

      publication.type_publication_id = params[:numbertype]
      
        if publication.save
          Publication.send_new_publication_mail(publication)

          respond_to do |format|
            format.json { render json: publication, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: publication.errors, status: :unprocessable_entity }
          end
      end
  end
      
    def show
        publication = Publication.get_publication(params[:id])
      
        respond_to do |format|
          format.json { render json: publication, status:200 }
        end
    end
      
    def update_self
        publication = Publication.get_publication_self(params[:id], current_user.id)
      
        if publication.update(params_publication)
          respond_to do |format|
            format.json { render json: publication, status:200 }
          end
        else
          format.json { render json: publication.errors, status:422 }
        end
    end

    def destroy
        publication = Publication.get_publication(params[:id])
        publication.destroy
      
        respond_to do |format|
          format.json { render json: publication, status:200 }
        end
    end

    def destroy_self
      publication = Publication.get_publication_self(params[:id], current_user.id)
      publication.destroy
    
      respond_to do |format|
        format.json { render json: publication, status:200 }
      end
  end

    ##

    def params_publication
        params.permit(:name, :description, :startdate, :place, :latitude, :longitude, :type_publication_id, :user_id)
    end
end
