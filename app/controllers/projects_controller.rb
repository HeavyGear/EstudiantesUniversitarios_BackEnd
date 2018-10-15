class ProjectsController < ApplicationController
     def index
        user = User.find(params[:user_id])
        if user
          projects = user.projects
      
          respond_to do |format|
            format.json { render json: projects, status:200 }
          end
        end
      end
    
      def create
        user = User.find(params[:user_id])
    
        if user
          project = Project.new(params_project)
        end
    
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
        user = User.find(params[:user_id])
    
        if user
          project = user.projects().where(id: params[:id])
        end
      
        respond_to do |format|
          format.json { render json: project, status:200 }
        end
      end
    
      def update
        user = User.find(params[:user_id])
    
        if user
          project = user.projects().where(id: params[:id])
        end
      
        if project.update(params_user)
          respond_to do |format|
            format.json { render json: project, status:200 }
          end
        else
          format.json { render json: project.errors, status:422 }
        end
      end
    
      def destroy
        user = User.find(params[:user_id])
    
        if user
          project = user.projects().where(id: params[:id])
    
          project.destroy(params[:id])
        end
      
        respond_to do |format|
          format.json { render json: project, status:200 }
        end
      end

      #

      def params_project
        params.permit(:name, :description, :user_id, :supervisor_id, :project_state_id)
      end
end
