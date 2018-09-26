class HomeController < ApplicationController
  def index
  end

  def display_content
    @section = params[:section]
    @posts = Post.order('created_at DESC').all
    @message = Message.new

    respond_to do |format|
      format.js
    end
  end
end
