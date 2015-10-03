class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]
	before_action :require_user

	add_breadcrumb "Users", :users_path


	def index
		if params[:search]
			@users = User.search(params[:search]).order("person_id ASC")
		else
			@users = User.all.order("person_id ASC")
		end
	end

	def show
		add_breadcrumb "View User Details", :user_path
	end
	
	def new
		add_breadcrumb "New User", :new_user_path

		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			#session[:user_id] = @user.id
			flash[:success] = "User was successfully created!"
			redirect_to @user
		else
			render "new"
		end
		
	end

	def edit
		add_breadcrumb "Edit User Details", :edit_user_path
	end

	def update
		if @user.update(user_params)
			flash[:success] = "User was successfully updated!"
			redirect_to @user
		else
			render "edit"
		end
		
	end

	def destroy

	end

	private
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :role, :locale, :person_id, :email)
	end

end
