class PasswordResetsController < ApplicationController
  
  layout "login"

  def create
  	@user = User.find_by_username(params[:username])
  	@user.send_password_reset if @user
  	flash[:notice] = "An email has been sent with password reset instructions"
  	redirect_to login_path
  end

  def edit
  	@user = User.find_by_password_reset_token!(params[:id])
  end

  def update
  	@user = User.find_by_password_reset_token!(params[:id])
  	if @user.password_reset_sent_at < 2.hours.ago
  		flash[:error] = "This password reset link has expired" 
  		redirect_to login_path
  	elsif @user.update_attributes(params.permit![:user])
		flash[:notice] = "Your password has been reset" 
  		redirect_to login_path
  	else
  		render :edit
  	end
  end
end
