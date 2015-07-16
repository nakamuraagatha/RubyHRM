class SessionsController < ApplicationController

	layout "login"

	def new 

	end

	def create
		@user = User.find_by_username(params[:session][:username])
		if @user && @user.authenticate(params[:session][:password])
			if params[:remember_me]
				#session[:user_id] = @user.id
				cookies.permanent[:auth_token] = @user.auth_token
			else
				cookies[:auth_token] = @user.auth_token
			end
			flash[:notice] = "Login Successful!"
			redirect_to root_url
		else
			flash.now[:error] = "Username or password is invalid. Please try again."
			render "new"
		end
	end

	def destroy
		#session[:user_id] = nil
		cookies.delete(:auth_token)
		flash[:notice] = "You have been logged out successfully"
		redirect_to login_path
	end
end
