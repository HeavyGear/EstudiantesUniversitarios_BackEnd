class DocumentsController < ApplicationController
    def index
        documents = Document.all.paginate(page: params[:page], per_page: 5)
    
        respond_to do |format|
          format.json { render json: documents, status:200 }
        end
    end
      
    def create
        dosument = Document.new(params_document)
      
        if document.save
          respond_to do |format|
            format.json { render json: document, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: document.errors, status: :unprocessable_entity }
          end
        end
    end
      
    def show
        document = Document.find(params[:id])
      
        respond_to do |format|
          format.json { render json: document, status:200 }
        end
    end
      
    def update
        document = Document.find(params[:id])
      
        if document.update(params_document)
          respond_to do |format|
            format.json { render json: document, status:200 }
          end
        else
          format.json { render json: document.errors, status:422 }
        end
    end

    def destroy
        document = Document.find(params[:id])
        document.destroy
      
        respond_to do |format|
          format.json { render json: document, status:200 }
        end
    end

    ##

    def params_document
        params.permit(:content, :uploadeable_type, :uploadeable_id)
    end
end
