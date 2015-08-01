class PersonCertificationsController < ApplicationController
	before_action :require_user

	def new
		@person_certification = PersonCertification.new
	end

	def create
		@person_certification = PersonCertification.new(person_certification_params)
		if @person_certification.save
			flash[:success] = "Certification has been added"
			redirect_to qualifications_path(@person_certification.person_id)
		else
			render 'new'
		end
	end

	def destroy
		@person_certification = PersonCertification.find(params[:id])
		if @person_certification.destroy
			flash[:success] = "Certification has been deleted"
			redirect_to qualifications_path(@person_certification.person_id)
		end
	end

	private
		def person_certification_params
			params.require(:person_certification).permit(:person_id, :certification_id, :institute, :grant_date, :valid_thru_date )
		end
end
