class AuthFatherController < ApiController

  def new
    @user = User.new
    @parent_token = params[:id]
  end

  def signup

    #POST /api/v1/singup
    user = User.new( father_params )
    user.sexuality = "m"
    # TODO find
    parent = Parent.find_by( :token => params[:id] )
    if user.save
      parent.father_id = user.id
      parent.save
      flash[:notice] = "註冊成功"
    else
      flash[:notice] = "註冊有錯"
    end
  end

  def father_params
    params.require(:user).permit(:email, :password, :sexuality)
  end

end
