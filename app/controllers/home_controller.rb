class HomeController < ApplicationController
  def index
    @pages = Page.order(:priority)
  end

  def display_content
    @section = params[:section]
    @page = Page.find_by(id: params[:page_id])
    @posts = Post.order('created_at DESC').all
    @message = Message.new

    respond_to do |format|
      format.js
    end
  end
end
