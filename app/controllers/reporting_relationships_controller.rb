class ReportingRelationshipsController < ApplicationController
	def new
		@reporting_relationship = ReportingRelationship.new
	end

	def create
		@reporting_relationship = ReportingRelationship.new(reporting_relationship_params)
		if @reporting_relationship.save
			flash[:notice] = "Manager has been added"
			redirect_to reports_to_details_path(@reporting_relationship.person_id)
		else
			render 'new'
		end
	end

	def destroy
		@reporting_relationship = ReportingRelationship.find(params[:id])
		@reporting_relationship.destroy
	end

	private
		def reporting_relationship_params
			params.require(:reporting_relationship).permit(:person_id, :manager_id, :reporting_type)
		end
end
