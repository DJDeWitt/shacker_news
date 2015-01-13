class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def current_user
    @_current_user ||= session[:user_id] &&
      User.find_by(id: session[:user_id])
  end
  helper_method :current_user
  private :current_user

  def logged_in?
    current_user != nil
  end
  helper_method :logged_in?
  private :logged_in?

end
