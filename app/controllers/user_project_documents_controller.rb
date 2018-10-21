class UserProjectDocumentsController < ApplicationController
    def index
        user_project_documents = UserProjectDocument.all.paginate(page: params[:page], per_page: 5)
    
        respond_to do |format|
          format.json { render json: user_project_documents, status:200 }
        end
    end
      
    def create
        user_project_document = UserProjectDocument.new(params_user_project_document)
      
        if user_project_document.save
          respond_to do |format|
            format.json { render json: user_project_document, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: user_project_document.errors, status: :unprocessable_entity }
          end
        end
    end
      
    def show
        user_project_document = UserProjectDocument.find(params[:id])
      
        respond_to do |format|
          format.json { render json: user_project_document, status:200 }
        end
    end
      
    def update
        user_project_document = UserProjectDocument.find(params[:id])
      
        if user_project_document.update(params_user_project_document)
          respond_to do |format|
            format.json { render json: user_project_document, status:200 }
          end
        else
          format.json { render json: user_project_document.errors, status:422 }
        end
    end

    def destroy
        user_project_document = user_project_document.find(params[:id])
        user_project_document.destroy
      
        respond_to do |format|
          format.json { render json: user_project_document, status:200 }
        end
    end

    ##

    def params_user_project_document
        params.permit(:revisionDate, :comment, :response)
    end
end
