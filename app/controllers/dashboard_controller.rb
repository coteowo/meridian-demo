class DashboardController < ApplicationController
  before_action { @protocolo = "Meridian" }
  before_action :require_login

  # GET /panel
  def index
    @usuario = session[:usuario]
  end

  private

  # Protege el panel: si no hay sesión, manda al login.
  def require_login
    redirect_to "/login" unless session[:usuario]
  end
end
