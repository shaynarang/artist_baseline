class HomeController < ApplicationController
  def index
  end

  def display_content
    @section = params[:section]
    @message = Message.new

    respond_to do |format|
      format.js
    end
  end
end
