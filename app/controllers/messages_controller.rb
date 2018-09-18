class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    MessageMailer.new_message(@message).deliver if @message.valid?
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :content)
  end
end
