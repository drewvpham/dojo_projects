class SessionsController < ApplicationController
  def create
      auth_hash=auth
    
      user= User.find_or_create_by_omniauth(auth_hash)
      session[:user_id]=user.id
      redirect_to projects_path
      #
      # oauth_email=request.env['omniauth.auth']['info']['email']
      # username=request.env['omniauth.auth']['info']['nickname']
      # image= request.env['omniauth.auth']['info']['image']
      # location = request.env['omniauth.auth']['extra']['location']
      # if user=User.find_by(email: oauth_email)
      #   session[:user_id]=user.id
      #   redirect_to users_path
      #
      # else
      #   user=User.new(email: oauth_email, password: SecureRandom.hex, username:username )
      #   if user.save
      #   session[:user_id]=user.id
      #
      #   redirect_to users_path
      # end
      #
      # end
    # else
    #   user=User.find_by(email: user_params[:email])
    #   if user && user.authenticate(user_params[:password])
    #     session[:user_id]=user.id
    #     redirect_to user_path
    #   else
    #     flash[:login_error]='Invalid credentials'
    #     redirect_to :back
    #   end
    # end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
