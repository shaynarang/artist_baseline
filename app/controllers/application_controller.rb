class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_theme

  def set_theme
    @theme = Site.first&.themes&.published[0]
  end
end
