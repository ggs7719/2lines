class WelcomeController < ApplicationController
  def index
  end


  # 串連爸爸頁面
  def show
  end

  # 發送串連爸爸的email
  def connect_father
    comment = params[:comment]
    email = params[:email]

      UserMailer.notify_comment(email, current_user, comment).deliver_now!
    
  end
end