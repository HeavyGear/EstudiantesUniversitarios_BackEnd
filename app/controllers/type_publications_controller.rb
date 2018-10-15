class TypePublicationsController < ApplicationController
    def index
        type_publications = TypePublication.all.paginate(page: params[:page], per_page: 5)
    
        respond_to do |format|
          format.json { render json: type_publications, status:200 }
        end
    end
      
    def create
        type_publication = TypePublication.new(params_type_publications)
      
        if type_publication.save
          respond_to do |format|
            format.json { render json: type_publication, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: type_publication.errors, status: :unprocessable_entity }
          end
        end
    end
      
    def show
        type_publication = TypePublication.find(params[:id])
      
        respond_to do |format|
          format.json { render json: type_publication, status:200 }
        end
    end
      
    def update
        type_publication = TypePublication.find(params[:id])
      
        if type_publication.update(params_type_publications)
          respond_to do |format|
            format.json { render json: type_publication, status:200 }
          end
        else
          format.json { render json: type_publication.errors, status:422 }
        end
    end

    def destroy
        type_publication = TypePublication.find(params[:id])
        type_publication.destroy
      
        respond_to do |format|
          format.json { render json: type_publication, status:200 }
        end
    end

    ##

    def params_type_publications
        params.permit(:name)
    end
end
