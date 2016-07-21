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
    token = params[:token]
    user = params[:user]

      UserMailer.notify_comment(email, comment, token).deliver_now!
    
  end

  # 爸爸點擊連結註冊
  # def catch
  #   parent = Parent.find_by(:token => params[:token])
  #   # parent.mother_id 



  #   parent.update(:fother_id => father.id)
  # end

end