class ApiV1::AuthController < ApiController

  before_action :authenticate_user!, :only => [:logout]

  def signup
    success = false
    #POST /api/v1/singup

    if params[:email] && params[:password]

      user = User.new(:email => params[:email], :password => params[:password], :sexuality => "f")
      if user.save
        render :json => { :message => "Ok",
                        :ios_token => user.ios_token,
                        :user_id => user.id,
                        :sexuality => user.sexuality}
      else
        render :json => { :message => "Email or Password is wrong" }, :status => 401
      end

    end
  end

  def login
    success = false

    if params[:email] && params[:password]
      user = User.find_by_email( params[:email] )
      success = user && user.valid_password?( params[:password] )
    elsif params[:fb_token]
      # fb_data = User.get_fb_data( params[:fb_token] )
      j = RestClient.get "https://graph.facebook.com/v2.5/me", :params => { :access_token => params[:fb_token], :fields => "id,name,email,picture" }
      fb_data = JSON.parse(j)
      if fb_data
        auth_hash = OmniAuth::AuthHash.new({
          uid: fb_data["id"],
          info: {
            email: fb_data["email"]
          },
          credentials: {
            token: params[:fb_token]
          }
        })
        user = User.from_omniauth(auth_hash)
      end

      success = fb_data && user.persisted?

    end

    if success
      render :json => { :message => "Ok",
                        :ios_token => user.ios_token,
                        :user_id => user.id}
    else
      render :json => { :message => "Email or Password is wrong" }, :status => 401
    end
  end

  def logout
    user = User.find_by_ios_token(params[:ios_token])
    user.generate_ios_token
    if user.save!
      render :json => { :message => "Ok"}
    else
      render :json => { :message => "fail"}
    end
  end

end
