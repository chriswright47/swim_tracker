class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = 'Logged in!'
      redirect_to root_url
    end
  rescue User::AuthenticationError => e
    flash.now[:danger] = e.message
    render 'new'
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Logged out!'
    redirect_to root_url
  end
end