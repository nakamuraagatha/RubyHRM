class PersonTerminationsController < ApplicationController

	def show
		@person_termination = PersonTermination.find(params[:id])
	end

	def new
		@person_termination = PersonTermination.new
	end

	def create
		@person_termination = PersonTermination.new(person_terminations_params)
		if @person_termination.save
			flash[:success] = "The employee has been terminated"
			redirect_to job_details_path(@person_termination.person_id)
		else
			render 'new'
		end
	end

	def destroy
		@person_termination = PersonTermination.find(params[:id])
		if @person_termination.destroy
			flash[:success] = "The employee has been reactivated"
			redirect_to job_details_path(@person_termination.person_id)
		end
	end

	private
		def person_terminations_params
			params.require(:person_termination).permit(:person_id, :termination_reason_id, :termination_date, :note)
		end
end
