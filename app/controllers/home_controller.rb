class HomeController < ApplicationController
  def index
  end

  def display_content
    @section = params[:section]
    @bio = Bio.first
    @posts = Post.order('created_at DESC').all
    @social_feed = SocialFeed.first
    @message = Message.new

    respond_to do |format|
      format.js
    end
  end
end
