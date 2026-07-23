class AuthController < ApplicationController
  before_action { @protocolo = "Meridian" }

  # Ambas acciones usan el mismo partial (_auth_page), solo cambia el "mode".
  def login; end
  def register; end
end
