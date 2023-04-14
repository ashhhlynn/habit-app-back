class AuthController < ApplicationController

    def create
      if auth
        user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.email = auth['info']['email']
          u.password = SecureRandom.hex
        end 
          token = encode_token({ user_id: user.id })
          render json: { user: user, jwt: token }
      else 
      @user = User.find_by(email: user_login_params[:email])
      if @user && @user.authenticate(user_login_params[:password])
        token = encode_token({ user_id: @user.id })
        render json: { user: @user, jwt: token }
      else
        render json: { message: 'Invalid username or password.' }
      end
    end
  end 
    
  private
    
  def user_login_params
      params.require(:user).permit(:email, :password)
  end
    
  def auth
    request.env['omniauth.auth']
  end
  
end