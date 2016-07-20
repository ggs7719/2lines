class UserMailer < ApplicationMailer
  default :from => "jimmyhoo7719@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #

  def notify_comment(email, user, comment)
        @comment = comment
        @email = email
        mail(:to => @email, :subject => "期待您加入2 Lines！")
  end
end
