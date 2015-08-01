class SkillsController < ApplicationController
	before_action :set_skill, only: [:edit, :update, :destroy]
	before_action :require_admin

	def index
		@skills = Skill.all
	end

	def new
		@skill = Skill.new
	end

	def create
		@skill = Skill.new(skill_params)
		if @skill.save
			flash[:success] = "Skill has been successfully created"
			redirect_to skills_path
		end
	end

	def edit

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
