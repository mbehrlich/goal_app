class SessionsController < ApplicationController

  before_action :ensure_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(session_params[:username], session_params[:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid username and/or password"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  def session_params
    params.require(:user).permit(:username, :password)
  end

end
