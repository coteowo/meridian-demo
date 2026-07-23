class AuthController < ApplicationController
  before_action { @protocolo = "Meridian" }

  # Usuario de demostración (en una app real esto vendría de un modelo User en la BD).
  USUARIO  = "usuario"
  CLAVE    = "123"

  # GET /login y GET /register → ambas usan el mismo partial (_auth_page), cambia el "mode".
  def login; end
  def register; end

  # POST /login → valida credenciales y crea la sesión.
  def create
    if params[:username].to_s.strip == USUARIO && params[:password].to_s == CLAVE
      session[:usuario] = USUARIO
      redirect_to "/panel"
    else
      @error = "Usuario o contraseña incorrectos."
      render :login, status: :unprocessable_entity
    end
  end

  # GET /logout → termina la sesión.
  def destroy
    reset_session
    redirect_to "/"
  end
end
