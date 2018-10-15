class ProjectDocumentsController < ApplicationController
    def index
        project = Project.find(params[:project_id])
        if project
          project_documents = project.project_documents
      
          respond_to do |format|
            format.json { render json: project_documents, status:200 }
          end
        end
      end
    
      def create
        project = Project.find(params[:project_id])
    
        if project
          project_document = ProjectDocument.new(params_project_document)
        end
    
        if project_document.save
          respond_to do |format|
            format.json { render json: project_document, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: project_document.errors, status: :unprocessable_entity }
          end
        end
      end
    
      def show
        project = Project.find(params[:project_id])
    
        if project
          project_document = project.project_documents().where(id: params[:id])
        end
      
        respond_to do |format|
          format.json { render json: project_document, status:200 }
        end
      end
    
      def update
        project = Project.find(params[:project_id])
    
        if project
          project_document = project.project_documents().where(id: params[:id])
        end
      
        if project_document.update(params_project_document)
          respond_to do |format|
            format.json { render json: project_document, status:200 }
          end
        else
          format.json { render json: project_document.errors, status:422 }
        end
      end
    
      def destroy
        project = Project.find(params[:project_id])
    
        if project
          project_document = project.project_documents().where(id: params[:id])
    
          project_document.destroy(params[:id])
        end
      
        respond_to do |format|
          format.json { render json: project_document, status:200 }
        end
      end

      #

      def params_project_document
        params.permit(:document_state_id, :project_id, :approved, :year, :period)
      end
end
