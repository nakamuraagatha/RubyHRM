class SkillsController < ApplicationController
	before_action :set_skill, only: [:edit, :update, :destroy]
	before_action :require_admin

	add_breadcrumb "Skills", :skills_path


	def index
		if params[:search]
			@skills = Skill.search(params[:search])
		else
			@skills = Skill.all
		end
	end

	def new
		add_breadcrumb "New Skill", :new_skill_path

		@skill = Skill.new
	end

	def create
		@skill = Skill.new(skill_params)
		if @skill.save
			flash[:success] = "Skill has been successfully created"
			redirect_to skills_path
		else
			render "new"
		end
	end

	def edit
		add_breadcrumb "Edit Skill", :edit_skill_path
	end

	def update
		if @skill.update_attributes(skill_params)
			flash[:success] = "Skill has been successfully updated"
			redirect_to skills_path
		end
	end

	def destroy
		if @skill.destroy
			flash[:success] = "Skill has been successfully deleted"
			redirect_to skills_path
		end
	end

	private
		def set_skill
			@skill = Skill.find(params[:id])
		end

		def skill_params
			params.require(:skill).permit(:skill_description)
		end
end
