class MajorsController < ApplicationController
    def index
        majors = Major.get_majors.paginate(page: params[:page], per_page: 5)
    
        respond_to do |format|
          format.json { render json: majors, status:200 }
        end
    end
      
    def create
        major = Major.new(params_major)
      
        if major.save
          respond_to do |format|
            format.json { render json: major, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: major.errors, status: :unprocessable_entity }
          end
        end
    end
      
    def show
        major = Major.get_major(params[:id])
      
        respond_to do |format|
          format.json { render json: major, status:200 }
        end
    end
      
    def update
        major = Major.get_major(params[:id])
      
        if major.update(params_major)
          respond_to do |format|
            format.json { render json: major, status:200 }
          end
        else
          format.json { render json: major.errors, status:422 }
        end
    end

    def destroy
        major = Major.get_major(params[:id])
        major.destroy
      
        respond_to do |format|
          format.json { render json: major, status:200 }
        end
    end

    ##

    def params_major
        params.permit(:name)
    end
end
