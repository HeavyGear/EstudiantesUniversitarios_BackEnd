class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  #Incluir Knock en la aplicación
  include Knock::Authenticable
end
