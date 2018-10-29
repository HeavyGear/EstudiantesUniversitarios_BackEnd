class ProjectsController < ApplicationController
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
  
  def update
    project = Project.get_project(params[:id])
  
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
  
  #

  def params_project
    params.permit(:name, :description, :user_id, :supervisor_id, :project_state_id)
  end
end
