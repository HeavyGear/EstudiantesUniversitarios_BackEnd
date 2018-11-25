class DocumentStatesController < ApplicationController
  # Filtro que verifica si el usuario está autenticado
  before_action :authenticate_user

  ##

  def index
      document_states = DocumentState.get_document_states().paginate(page: params[:page], per_page: 3)
  
      respond_to do |format|
        format.json { render json: document_states, status:200 }
      end
  end
    
  def show
      document_state = DocumentState.get_document_state(params[:id])
    
      respond_to do |format|
        format.json { render json: document_state, status:200 }
      end
  end

  ##

  def params_document_state
      params.permit(:name)
  end
end
