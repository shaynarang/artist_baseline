class MessageMailer < ActionMailer::Base
  default :to => ENV['ADMIN_EMAIL']

  def new_message(message)
    @message = message
    mail(:from => message.email, :subject => message.subject)
  end
end