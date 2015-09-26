class JobDetailHistoriesController < ApplicationController
	before_action :require_user
	
	def destroy
		@job_detail_history = JobDetailHistory.find(params[:id])
		if @job_detail_history.destroy
			flash[:success] = "Job history has been deleted"
			redirect_to person_job_detail_path(@job_detail_history.job_detail_id, @job_detail_history.job_detail_id)
		end
	end
end
