class ImagesController < ApplicationController
    def index
        images = Image.all.paginate(page: params[:page], per_page: 5)
    
        respond_to do |format|
          format.json { render json: images, status:200 }
        end
    end
      
    def create
        image = Image.new(params_image)
      
        if image.save
          respond_to do |format|
            format.json { render json: image, status:201 }
          end
        else
          respond_to do |format|
            format.json { render json: image.errors, status: :unprocessable_entity }
          end
        end
    end
      
    def show
        image = Image.find(params[:id])
      
        respond_to do |format|
          format.json { render json: image, status:200 }
        end
    end
      
    def update
        image = Image.find(params[:id])
      
        if image.update(params_image)
          respond_to do |format|
            format.json { render json: image, status:200 }
          end
        else
          format.json { render json: image.errors, status:422 }
        end
    end

    def destroy
        image = Image.find(params[:id])
        image.destroy
      
        respond_to do |format|
          format.json { render json: image, status:200 }
        end
    end

    ##

    def params_image
        params.permit(:content, :imageable_type, :imageable_id)
    end
end
