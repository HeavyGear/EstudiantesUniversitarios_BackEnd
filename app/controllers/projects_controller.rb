class ProjectsController < ApplicationController
  # Filtro que verifica si el usuario está autenticado
  before_action :authenticate_user

  # Filtro que verifica que los únicos con acceso a la información de las universidades son los administradores
  before_action :verify_role_admin, only: [:index, :show, :destroy]

  # Filtro que verifica que los únicos con acceso a la información de las universidades son los usuarios
  before_action :verify_role_user, only: [:show_self, :update_self, :destroy_self] 

  ##

  def index
    projects = Project.get_projects.paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.json { render json: projects, status:200 }
    end
  end
  
  def create
    project = Project.new(params_project)
  
    if project.save
      respond_to do |format|
        format.json { render json: project, status:201 }
      end
    else
      respond_to do |format|
        format.json { render json: project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    project = Project.get_project(params[:id])
  
    respond_to do |format|
      format.json { render json: project, status:200 }
    end
  end

  def show_self
    project = Project.get_project_self(params[:id], current_user.id)
  
    respond_to do |format|
      format.json { render json: project, status:200 }
    end
  end
  
  def update_self
    project = Project.get_project_self(params[:id], current_user.id)
  
    if project.update(params_project)
      respond_to do |format|
        format.json { render json: project, status:200 }
      end
    else
      format.json { render json: project.errors, status:422 }
    end
  end
  
  def destroy
    project = Project.get_project(params[:id])
    project.destroy
  
    respond_to do |format|
      format.json { render json: project, status:200 }
    end
  end

  def destroy_self
    project = Project.get_project_self(params[:id], current_user.id)
    project.destroy
  
    respond_to do |format|
      format.json { render json: project, status:200 }
    end
  end
  
  #

  def params_project
    params.permit(:name, :description, :user_id)
  end
end
