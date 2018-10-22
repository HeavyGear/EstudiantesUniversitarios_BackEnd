class DocumentStatesController < ApplicationController
    def index
        document_states = DocumentState.all.paginate(page: params[:page], per_page: 5)
    
        respond_to do |format|
          format.json { render json: document_states, status:200 }
      end
    end
      
    def create
        document_state = DocumentState.new(params_document_state)
      
        if document_state.save
          respond_to do |format|
            format.json { render json: document_state, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: document_state.errors, status: :unprocessable_entity }
          end
        end
    end
      
    def show
        document_state = DocumentState.find(params[:id])
      
        respond_to do |format|
          format.json { render json: document_state, status:200 }
        end
    end
      
    def update
        document_state = DocumentState.find(params[:id])
      
        if document_state.update(params_document_state)
          respond_to do |format|
            format.json { render json: document_state, status:200 }
          end
        else
          format.json { render json: document_state.errors, status:422 }
        end
    end

    def destroy
        document_state = DocumentState.find(params[:id])
        document_state.destroy
      
        respond_to do |format|
          format.json { render json: document_state, status:200 }
        end
    end

    ##

    def params_document_state
        params.permit(:name)
    end
end
