class ProjectDocumentsController < ApplicationController
  # Filtro que verifica si el usuario está autenticado
  before_action :authenticate_user

  # Filtro que verifica que los únicos con acceso a la información de los documentos de proyecto son los administradores
  before_action :verify_role_admin, only: [:index, :show, :update, :destroy]

  ##

  def index_project
      project_documents = ProjectDocument.get_project_documents(params[:project_id]).paginate(page: params[:page], per_page: 5)
  
      respond_to do |format|
          format.json { render json: project_documents, status:200 }
      end
  end

  def index
    project_documents = ProjectDocument.get_all_project_documents().paginate(page: params[:page], per_page: 5)

    respond_to do |format|
        format.json { render json: project_documents, status:200 }
    end
end

  def index_self
    project = Project.get_project(params[:project_id])
    project_documents = ProjectDocument.get_project_documents(params[:project_id]).paginate(page: params[:page], per_page: 5)
  
    if project.user_id == current_user.id
      respond_to do |format|
        format.json { render json: project_documents, status:200 }
      end
    else
      format.json { render json: project_documents.errors, status:422 }
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
    project_document = ProjectDocument.get_project_document(params[:project_id], params[:id])
  
    respond_to do |format|
      format.json { render json: project_document, status:200 }
    end
  end

  def show_self
    project = Project.get_project(params[:project_id], params[:project_id])
    project_document = ProjectDocument.get_project_document(params[:id])
  
    if project.user_id == current_user.id
      respond_to do |format|
        format.json { render json: project_document, status:200 }
      end
    else
      format.json { render json: project_document.errors, status:422 }
    end
  end
  
  def update
    project_document = ProjectDocument.get_project_document(params[:project_id], params[:id])
  
    if project_document.update(params_project_document)
      respond_to do |format|
        format.json { render json: project_document, status:200 }
      end
    else
      format.json { render json: project_document.errors, status:422 }
    end
  end

  def update_self
    project = Project.get_project(params[:project_id], params[:project_id])
    project_document = ProjectDocument.get_project_document(params[:id])
  
    if project.user_id == current_user.id
      if project_document.update(params_project_document)
        respond_to do |format|
          format.json { render json: project_document, status:200 }
        end
      else
        format.json { render json: project_document.errors, status:422 }
      end
    else
      format.json { render json: project_document.errors, status:422 }
    end
  end
  
  def destroy
    project_document = ProjectDocument.get_project_document(params[:project_id], params[:id])
    project_document.destroy
  
    respond_to do |format|
      format.json { render json: project_document, status:200 }
    end
  end

  def destroy_self
    project = Project.get_project(params[:project_id], params[:project_id])
    project_document = ProjectDocument.get_project_document(params[:id])
  
    if project.user_id == current_user.id
      project_document.destroy

      respond_to do |format|
        format.json { render json: project_document, status:200 }
      end
    else
      format.json { render json: project_document.errors, status:422 }
    end
  end
  
  #

  def params_project_document
    params.permit(:document_state_id, :project_id, :year, :period)
  end
end
