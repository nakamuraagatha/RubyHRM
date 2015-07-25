class JobDetailHistoriesController < ApplicationController
	def destroy
		@job_detail_history = JobDetailHistory.find(params[:id])
		if @job_detail_history.destroy
			flash[:success] = "Job history has been deleted"
			redirect_to job_details_path(@job_detail_history.person_id)
		end
	end
end
