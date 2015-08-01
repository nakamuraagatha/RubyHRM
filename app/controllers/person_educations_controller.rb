class PersonEducationsController < ApplicationController
	before_action :require_user

	def new
		@person_education = PersonEducation.new
	end

	def create
		@person_education = PersonEducation.new(person_education_params)
		if @person_education.save
			flash[:success] = "Education has been added"
			redirect_to qualifications_path(@person_education.person_id)
		else
			render 'new'
		end
	end

	def destroy
		@person_education = PersonEducation.find(params[:id])
		if @person_education.destroy
			flash[:success] = "Education has been deleted"
			redirect_to qualifications_path(@person_education.person_id)
		end
	end

	private
		def person_education_params
			params.require(:person_education).permit(:person_id, :education_level_id, :institute, :start_date, :completion_date )
		end
end
