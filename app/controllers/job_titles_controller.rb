class JobTitlesController < ApplicationController
	before_action :set_job_title, only: [:show, :edit, :update, :destroy]
	before_action :require_user
	
  	add_breadcrumb "Job Titles", :job_titles_path


	def index
		if params[:search]
			@job_titles = JobTitle.search(params[:search])
		else
			@job_titles = JobTitle.all
		end
		@count = @job_titles.count
		@total_count = JobTitle.count
	end

	def show
  		add_breadcrumb "View Job Title", :job_title_path
	end

	def new
  		add_breadcrumb "New Job Title", :new_job_title_path

		@job_title = JobTitle.new
	end

	def create
		@job_title = JobTitle.new(job_title_params)
		if @job_title.save
			flash[:success] = "Job Title was successfully created!"
			redirect_to @job_title
		else
			render "new"
		end
		
	end

	def edit
  		add_breadcrumb "Edit Job Title", :edit_job_title_path
	end

	def update
		if @job_title.update(job_title_params)
			flash[:success] = "Job Title was successfully updated!"
			redirect_to @job_title
		else
			render "edit"
		end		
	end

	def destroy
		@job_title.destroy
	end

	private
		def set_job_title
			@job_title = JobTitle.find(params[:id])
		end

		def job_title_params
			params.require(:job_title).permit(:job_title, :job_description)
		end
end
