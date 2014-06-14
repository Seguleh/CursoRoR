class SessionController < ApplicationController

	def new
	end

	def create
		user = User.authenticate(params[:user][:email], params[:user][:password])
		
		unless user.nil?
			session[:user] = user.id
			redirect_to root_url, :notice => "Logged in!"
		else
			flash[:notice] = "Invalid email or password"
			render "new"
		end
	end
end
