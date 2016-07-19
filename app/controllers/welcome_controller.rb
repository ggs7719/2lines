class WelcomeController < ApplicationController
  def index
  end


  # 串連爸爸頁面
  def show
  end

  #發送串連爸爸的email
  def conect_father
    comment = Comment.new(comment_params)
    if comment.save
      UserMailer.notify_comment(current_user, comment).deliver_now!
      redirect_to index_path
    else
      redirect_to index_path
    end
  end
end