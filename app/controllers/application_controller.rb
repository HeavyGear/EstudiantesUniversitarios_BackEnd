class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  #Incluir Knock en la aplicación
  include Knock::Authenticable

  ##

    # Filtro que verifica que los únicos con acceso a cierta información son los administradores
    def verify_role
      if current_user.role_id != 1
        render 'Unauthorized', status: 401
      end
    end

  ##
end
