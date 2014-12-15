class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => 'Logged in!'
    end
  rescue User::AuthenticationError => e
    flash.now.alert = e.message
    render 'new'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Logged out!'
  end
end