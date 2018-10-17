class HomeController < ApplicationController
    # Filtro que verifica si el cliente está autorizado para usar el método auth
    before_action :authenticate_user, only: [:auth]

    # Método público que muestra una respuesta en la ruta principal
    def index
        render json: { service: 'auth-api', status: 200 }
    end

    # Indica el nombre del usuario con el que actualmente se ha iniciado sesión
    def auth
        render json: { status: 200, msg: "Actualmente has iniciado sesión como #{current_user.name}" }
    end
end
