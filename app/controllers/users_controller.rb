class UsersController < ApplicationController
  # Usar Knock para asegurarse que el usuario está autenticado
  before_action :authenticate:user, only: [:index, :show, :update, :destroy]

  def index
    users = User.all.paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.json { render json: users, status:200 }
    end
  end
  
  def create
    user = User.new(params_user)
  
    if user.save
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
    user = User.find(params[:id])
  
    respond_to do |format|
      format.json { render json: user, status:200 }
    end
  end
  
  def update
    user = User.find(params[:id])
  
    if user.update(params_user)
      respond_to do |format|
        format.json { render json: user, status:200 }
      end
    else
      format.json { render json: user.errors, status:422 }
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
  
    respond_to do |format|
      format.json { render json: user, status:200 }
    end
  end
  
  ##

=begin

  def index
    role = Role.find(params[:role_id])
    if role
      users = role.users
  
      respond_to do |format|
        format.json { render json: users, status:200 }
      end
    end
  end

  def create
    role = Role.find(params[:role_id])

    if role
      user = User.new(params_user)
    end

    if user.save
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
    role = Role.find(params[:role_id])

    if role
      user = role.users().where(id: params[:id])
    end
  
    respond_to do |format|
      format.json { render json: user, status:200 }
    end
  end

  def update
    role = Role.find(params[:role_id])

    if role
      user = role.users().where(id: params[:id])
    end
  
    if user.update(params_user)
      respond_to do |format|
        format.json { render json: user, status:200 }
      end
    else
      format.json { render json: user.errors, status:422 }
    end
  end

  def destroy
    role = Role.find(params[:role_id])

    if role
      user = role.users().where(id: params[:id])

      user.destroy(params[:id])
    end
  
    respond_to do |format|
      format.json { render json: user, status:200 }
    end
  end

=end

  ##
  
  def params_user
    params.permit(:name, :idNumber, :email, :beneficiary)
  end
end
