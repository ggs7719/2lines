class WelcomeController < ApplicationController
  def index
  end


  # 串聯爸爸頁面
  def show
  end

  def conect_father
  	
    redirect_to index_url
  end

end