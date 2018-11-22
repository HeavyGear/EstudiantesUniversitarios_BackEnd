class UniversitiesController < ApplicationController
    # Filtro que verifica si el usuario está autenticado
    before_action :authenticate_user, only: [:update, :destroy]

    # Filtro que verifica que los únicos con acceso a la información de las universidades son los administradores
    before_action :verify_role_admin, only: [:update, :destroy]

    ##

    def index
        universities = University.get_universities().paginate(page: params[:page], per_page: 6)
    
        respond_to do |format|
          format.json { render json: universities, status:200 }
        end
    end

    def index_names
      universities = University.get_universities_names().paginate(page: params[:page], per_page: 6)
    
        respond_to do |format|
          format.json { render json: universities, status:200 }
        end
    end
      
    def create
        university = University.new(params_university)
      
        if university.save
          respond_to do |format|
            format.json { render json: university, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: university.errors, status: :unprocessable_entity }
          end
        end
    end
      
    def show
        university = University.get_university(params[:id])
      
        respond_to do |format|
          format.json { render json: university, status:200 }
        end
    end
      
    def update
        university = University.get_university(params[:id])
      
        if university.update(params_university)
          respond_to do |format|
            format.json { render json: university, status:200 }
          end
        else
          format.json { render json: university.errors, status:422 }
        end
    end

    def destroy
        university = University.find(params[:id])
        university.destroy
      
        respond_to do |format|
          format.json { render json: university, status:200 }
        end
    end

    ##

    def params_university
        params.permit(:name, :city, :department)
    end
end
