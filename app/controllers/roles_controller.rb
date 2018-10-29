class RolesController < ApplicationController
    def index
        roles = Role.get_roles().paginate(page: params[:page], per_page: 5)
    
        respond_to do |format|
          format.json { render json: roles, status:200 }
        end
    end
      
    def create
        role = Role.new(params_role)
      
        if role.save
          respond_to do |format|
            format.json { render json: role, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: role.errors, status: :unprocessable_entity }
          end
        end
    end
      
    def show
        role = Role.get_role(params[:id])
      
        respond_to do |format|
          format.json { render json: role, status:200 }
        end
    end
      
    def update
        role = Role.get_role(params[:id])
      
        if role.update(params_role)
          respond_to do |format|
            format.json { render json: role, status:200 }
          end
        else
          format.json { render json: role.errors, status:422 }
        end
    end

    def destroy
        role = Role.get_role(params[:id])
        role.destroy(params[:id])
      
        respond_to do |format|
          format.json { render json: role, status:200 }
        end
    end

    ##

    def params_role
        params.permit(:name)
    end
end