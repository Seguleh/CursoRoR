class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :auth!

  def current_user
  	User.find(session[:user])
  end

  def auth!

  	unless session[:user]
  		redirect_to new_session_path, notice: "Login bitch"
  	end

  end

end
