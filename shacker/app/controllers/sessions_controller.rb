class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  # "Create" a login, aka "log the user in"
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Welcome back, #{user.first_name}"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  # "Delete" a login, aka "log the user out"
  def destroy
    # Remove the user id from the session
    @_current_user = session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to posts_path
  end
end