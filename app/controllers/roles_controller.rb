class RolesController < ApplicationController
    # Filtro que verifica si el usuario está autenticado
    before_action :authenticate_user

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