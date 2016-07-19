class ApiController < ActionController::Base

  def authenticate_user_from_token!

    if params[:auth_token].present?
      user = User.find_by_ios_token( params[:auth_token] )

      sign_in(user, store: false) if user
    end
  end

end