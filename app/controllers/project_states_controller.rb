class ProjectStatesController < ApplicationController
    def index
        project_states = ProjectState.all.paginate(page: params[:page], per_page: 5)
    
        respond_to do |format|
          format.json { render json: project_states, status:200 }
        end
    end
      
    def create
        project_state = ProjectState.new(params_project_state)
      
        if project_state.save
          respond_to do |format|
            format.json { render json: project_state, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: project_state.errors, status: :unprocessable_entity }
          end
        end
    end
      
    def show
        project_state = ProjectState.find(params[:id])
      
        respond_to do |format|
          format.json { render json: project_state, status:200 }
        end
    end
      
    def update
        project_state = ProjectState.find(params[:id])
      
        if project_state.update(params_project_state)
          respond_to do |format|
            format.json { render json: project_state, status:200 }
          end
        else
          format.json { render json: project_state.errors, status:422 }
        end
    end

    def destroy
        project_state = ProjectState.find(params[:id])
        project_state.destroy
      
        respond_to do |format|
          format.json { render json: project_state, status:200 }
        end
    end

    ##

    def params_project_state
        params.permit(:name)
    end
end
