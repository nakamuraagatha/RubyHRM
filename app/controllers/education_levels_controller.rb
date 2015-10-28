class EducationLevelsController < ApplicationController
	before_action :set_education_level, only: [:edit, :update, :destroy]
	before_action :require_admin

	add_breadcrumb "Education Levels", :education_levels_path


	def index
		if params[:search]
			@education_levels = EducationLevel.search(params[:search])
		else
			@education_levels = EducationLevel.all
		end
	end

	def new
		add_breadcrumb "New Education Level", :new_education_level_path

		@education_level = EducationLevel.new
	end

	def create
		@education_level = EducationLevel.new(education_level_params)
		if @education_level.save
			flash[:success] = "Education Level has been successfully created"
			redirect_to education_levels_path
		else
			render "new"
		end
	end

	def edit
		add_breadcrumb "Edit Education Level", :edit_education_level_path
	end

	def update
		if @education_level.update_attributes(education_level_params)
			flash[:success] = "Education Level has been successfully updated"
			redirect_to education_levels_path
		end
	end


	def destroy
		if @education_level.destroy
			flash[:success] = "Education Level has been successfully deleted"
			redirect_to education_levels_path
		end
	end

	private
		def set_education_level
			@education_level = EducationLevel.find(params[:id])
		end

		def education_level_params
			params.require(:education_level).permit(:education_level_description)
		end
end
