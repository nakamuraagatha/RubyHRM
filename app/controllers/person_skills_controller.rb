class PersonSkillsController < ApplicationController
	before_action :require_user
	
	def new
		@person_skill = PersonSkill.new
	end

	def create
		@person_skill = PersonSkill.new(person_skill_params)
		if @person_skill.save
			flash[:success] = "Skill has been added"
			redirect_to qualifications_path(@person_skill.person_id)
		else
			render 'new'
		end
	end

	def destroy
		@person_skill = PersonSkill.find(params[:id])
		if @person_skill.destroy
			flash[:success] = "Skill has been deleted"
			redirect_to qualifications_path(@person_skill.person_id)
		end
	end

	private
		def person_skill_params
			params.require(:person_skill).permit(:person_id, :skill_id, :years_experience, :note)
		end
end
