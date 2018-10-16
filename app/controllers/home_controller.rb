class HomeController < ApplicationController
  def index
    @site = Site.first
    @pages = Page.published.order(:position)
    @page = @pages.first
    @posts = Post.order('created_at DESC').all
    @message = Message.new
  end

  def display_content
    @page_name = params[:page_name]
    @page = Page.find_by(id: params[:page_id])
    @posts = Post.order('created_at DESC').all
    @message = Message.new

    respond_to do |format|
      format.js
    end
  end
end
