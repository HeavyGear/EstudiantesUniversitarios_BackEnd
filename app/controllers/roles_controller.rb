class RolesController < ApplicationController
    # Filtro que verifica si el cliente está autorizado para usar el método auth
    before_action :authenticate_user, only: [:index, :show]

    # Filtro que verifica que los únicos con acceso a la información de los roles son los administradores
    before_action :verify_role, only: [:index, :show]

    ##

    # Filtro que verifica que los únicos con acceso a la información de los roles son los administradores
    def verify_role
      if current_user.role_id != 1
        render 'Unauthorized', status: 401
      end
    end

    ##

    def index
        roles = Role.get_roles().paginate(page: params[:page], per_page: 3)
    
        respond_to do |format|
          format.json { render json: roles, status:200 }
        end
    end
      
    def show
        role = Role.get_role(params[:id])
      
        respond_to do |format|
          format.json { render json: role, status:200 }
        end
    end

    ##

    def params_role
        params.permit(:name)
    end
end