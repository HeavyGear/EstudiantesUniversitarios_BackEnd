class PublicationsController < ApplicationController
    def index
        publications = Publication.all.paginate(page: params[:page], per_page: 5)
    
        respond_to do |format|
          format.json { render json: publications, status:200 }
        end
    end
      
    def create
        publication = Publication.new(params_publication)
      
        if publication.save
          respond_to do |format|
            format.json { render json: publication, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: publication.errors, status: :unprocessable_entity }
          end
        end
    end
      
    def show
        publication = Publication.find(params[:id])
      
        respond_to do |format|
          format.json { render json: publication, status:200 }
        end
    end
      
    def update
        publication = Publication.find(params[:id])
      
        if publication.update(params_publication)
          respond_to do |format|
            format.json { render json: publication, status:200 }
          end
        else
          format.json { render json: publication.errors, status:422 }
        end
    end

    def destroy
        publication = Publication.find(params[:id])
        publication.destroy
      
        respond_to do |format|
          format.json { render json: publication, status:200 }
        end
    end

    ##

    def params_publication
        params.permit(:name, :description, :startDate, :endDate, :place, :latitude, :longitude)
    end
end