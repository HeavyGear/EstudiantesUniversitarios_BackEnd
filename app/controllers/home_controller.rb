class HomeController < ApplicationController
    # Filtro que verifica si el cliente está autorizado para usar el método auth
    before_action :authenticate_user, only: [:auth]

    # Método público que muestra una respuesta en la ruta principal
    def index
        render json: { service: 'UniPastas Aldana BackEnd', status: 200 }
    end

    # Indica el nombre del usuario con el que actualmente se ha iniciado sesión
    def auth
        respond_to do |format|
            format.json { render json: current_user, status:200 }
        end
    end
end
