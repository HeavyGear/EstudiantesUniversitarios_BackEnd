class UniversitiesController < ApplicationController
    def index
        universities = University.all.paginate(page: params[:page], per_page: 5)
    
        respond_to do |format|
          format.json { render json: universities, status:200 }
        end
    end
      
    def create
        university = University.new(params_university)
      
        if university.save
          respond_to do |format|
            format.json { render json: university, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: university.errors, status: :unprocessable_entity }
          end
        end
    end
      
    def show
        university = University.find(params[:id])
      
        respond_to do |format|
          format.json { render json: university, status:200 }
        end
    end
      
    def update
        university = University.find(params[:id])
      
        if university.update(params_university)
          respond_to do |format|
            format.json { render json: university, status:200 }
          end
        else
          format.json { render json: university.errors, status:422 }
        end
    end

    def destroy
        university = University.find(params[:id])
        university.destroy
      
        respond_to do |format|
          format.json { render json: university, status:200 }
        end
    end

    ##

    def params_university
        params.permit(:name, :city, :department)
    end
end
