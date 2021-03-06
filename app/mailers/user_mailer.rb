class UserMailer < ApplicationMailer
  default :from => "twolines <jimmyhoo7719@gmail.com>"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #


  def notify_father(parent)
    @comment = parent.comment
    @email = parent.email
    @url = "http://139.162.7.161/connect_father/#{parent.token}"

    # new_accept_users_url( :token => @token )

    mail(:to => @email, :subject => "期待您加入2 Lines！")
  end

  # def notify_comment(email, comment, parent)
  #   @comment = comment
  #   @email = email
  #   @url = "http://139.162.7.161/users/sign_up"

  #   # new_accept_users_url( :token => @token )

  #   mail(:to => @email, :subject => "期待您加入2 Lines！")
  # end
end
