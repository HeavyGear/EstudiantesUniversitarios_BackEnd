class TypePublicationsController < ApplicationController
  def index
      types = TypePublication.all
      respond_to do |format|
        format.json { render json: types, status:200 }
      end
    end

    def create
      type = TypePublication.new(params_type_publication)

      if type.save
        respond_to do |format|
          format.json { render json: type, status:201 }
        end
      else
        respond_to do |format|
          format.json { render json: type.errors, status: :unprocessable_entity }
        end
      end
    end

    def show
      type = TypePublication.find(params[:id])

      respond_to do |format|
        format.json { render json: type, status:200 }
      end
    end

    def destroy
      type = TypePublication.find(params[:id])
      type.destroy

      respond_to do |format|
        format.json { render json: type, status:200 }
      end
    end

    def update
      type = TypePublication.find(params[:id])

      if type.update(params_type_publication)
        respond_to do |format|
          format.json { render json: type, status:200 }
        end
      else
        format.json { render json: type.errors, status:422 }
      end
    end

  ##

    def params_type_publication
      params.permit(:id, :name)
    end
end
