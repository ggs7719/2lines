class WelcomeController < ApplicationController
  def index
  end


  # 串連爸爸頁面
  def show
  end

  # 發送串連爸爸的email
  def connect_father

    parent = current_user.build_mother_parent( :email => params[:email], :comment => params[:comment])
    # Parent.new( :mother_id => current_user.id, :email => params[:email], :comment => params[:comment]  )
    parent.save

    UserMailer.notify_father(parent).deliver_now!

   # UserMailer.notify_comment(email, comment, parent).deliver_now!
    
  end

  # 爸爸點擊連結註冊
  # def catch
  #   parent = Parent.find_by(:token => params[:token])
  #   # parent.mother_id 



  #   parent.update(:fother_id => father.id)
  # end

end