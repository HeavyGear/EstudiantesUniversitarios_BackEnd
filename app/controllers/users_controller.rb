class UsersController < ApplicationController
  # Filtro que verifica si el usuario está autenticado
  before_action :authenticate_user, except: [:create]

  # Filtro que verifica que los únicos con acceso a la información de las universidades son los administradores
  before_action :verify_role_admin, only: [:index, :show, :update, :destroy]

  ##

  def index
    users = User.get_users.paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.json { render json: users, status:200 }
    end
  end
  
  def create
    user = User.new(params_user)
  
    if user.save
      User.send_new_user_mail(user)

      respond_to do |format|
        format.json { render json: user, status:201 }
      end
    else
      respond_to do |format|
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    user = User.get_user(params[:id])
  
    respond_to do |format|
      format.json { render json: user, status:200 }
    end
  end

  def show_self
    @user = User.get_user(current_user.id)
  
    respond_to do |format|
      format.json { render json: @user, status:200 }

      format.pdf do
        render pdf: "Certificado",
        template: "users/certificate.pdf.erb",
        page_size: 'A4'
      end
    end
  end
  
  def update
    user = User.get_user(params[:id])
  
    if user.update(params_user)
      respond_to do |format|
        format.json { render json: user, status:200 }
      end
    else
      format.json { render json: user.errors, status:422 }
    end
  end

  def update_self
    user = User.get_user(current_user.id)
  
    if user.update(params_user)
      respond_to do |format|
        format.json { render json: user, status:200 }
      end
    else
      format.json { render json: user.errors, status:422 }
    end
  end
  
  def destroy
    user = User.get_user(params[:id])
    user.destroy
  
    respond_to do |format|
      format.json { render json: user, status:200 }
    end
  end

  def destroy_self
    user = User.get_user(current_user.id)
    user.destroy
  
    respond_to do |format|
      format.json { render json: user, status:200 }
    end
  end

  ##
  
  def params_user
    params.permit(:name, :idnumber, :email, :role_id, :password)
  end
end
