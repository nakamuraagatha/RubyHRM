class TerminationsController < ApplicationController
	before_action :get_person_id
	before_action :require_user

	add_breadcrumb "Employees", :people_path


	def show
		add_breadcrumb "View Termination Details", :person_termination_path

		@termination = Termination.find_by_person_id(@person.id)
	end

	def new
		add_breadcrumb "Terminate Employee", :new_person_termination_path

		@termination = Termination.new
	end

	def create
		@termination = Termination.new(termination_params)
		if @termination.save
			flash[:success] = "The employee has been terminated"
			redirect_to person_job_detail_path(@person, @person.id)
		else
			render 'new'
		end
	end

	def destroy
		@termination = Termination.find_by_person_id(@person.id)
		if @termination.destroy
			flash[:success] = "The employee has been reactivated"
			redirect_to person_job_detail_path(@person, @person.id)
		end
	end

	private

	def get_person_id
		@person = Person.find(params[:person_id])
	end	
		
	def termination_params
		params.require(:termination).permit(:person_id, :termination_reason_id, :termination_date, :note)
	end
end
