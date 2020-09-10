class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_theme

  def set_theme
    published_theme = Site.first&.themes&.published
    return unless published_theme&.any?
    @theme = published_theme[0]
  end
end
