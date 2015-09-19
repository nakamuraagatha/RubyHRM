class JobDetailsController < ApplicationController
	before_action :get_person_id
	before_action :set_job_detail, only: [:show, :edit, :update]
	before_action :require_admin

	def show
	end

	def new
		@job_detail = JobDetail.new
	end

	def create
		@job_detail = JobDetail.new(job_detail_params)
		if @job_detail.save
			flash[:success] = "Job Details have been successfully created"
			redirect_to person_job_detail_path(@person)
		else 
			render "new"
		end
	end

	def edit
	end

	def update
		if @job_detail.update_attributes(job_detail_params)
			flash[:success] = "Job Details have been successfully updated"
			redirect_to person_job_detail_path(@person, @person.id)
		else 
			render "edit"
		end
	end

	private
	def set_job_detail
		@job_detail = JobDetail.find(params[:id])
	end

	def get_person_id
		@person = Person.find(params[:person_id])
	end

	def job_detail_params
		params.require(:job_detail).permit(:person_id, :start_date, :job_title_id, :department_id, :location_id)
	end
end
