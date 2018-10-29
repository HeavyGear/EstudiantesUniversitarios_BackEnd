class ProjectDocumentsController < ApplicationController
  def index
    project_documents = ProjectDocument.get_project_documents.paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.json { render json: project_documents, status:200 }
    end
  end
  
  def create
    project_document = ProjectDocument.new(params_project_document)
  
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
    project_document = ProjectDocument.get_project_document(params[:id])
  
    respond_to do |format|
      format.json { render json: project_document, status:200 }
    end
  end
  
  def update
    project_document = ProjectDocument.get_project_document(params[:id])
  
    if project_document.update(params_project_document)
      respond_to do |format|
        format.json { render json: project_document, status:200 }
      end
    else
      format.json { render json: project_document.errors, status:422 }
    end
  end
  
  def destroy
    project_document = ProjectDocument.get_project_document(params[:id])
    project_document.destroy
  
    respond_to do |format|
      format.json { render json: project_document, status:200 }
    end
  end
  
  #

  def params_project_document
    params.permit(:document_state_id, :project_id, :approved, :year, :period)
  end
end
