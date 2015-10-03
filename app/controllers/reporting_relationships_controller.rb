class ReportingRelationshipsController < ApplicationController
	before_action :get_person_id
	before_action :require_user

	add_breadcrumb "Supervisor Details", :person_reporting_relationships_path


	def index
		@reporting_relationships = @person.reporting_relationships
	end

	def show
		add_breadcrumb "View Supervisor Details", :person_reporting_relationship_path

		@reporting_relationship = ReportingRelationship.find(params[:id])
	end

	def new
		add_breadcrumb "Add Supervisor", :new_person_reporting_relationship_path

		@reporting_relationship = ReportingRelationship.new
	end	

	def create
		@reporting_relationship = ReportingRelationship.new(reporting_relationship_params)
		if @reporting_relationship.save
			flash[:success] = "Reporting Relationship has been added"
			redirect_to person_reporting_relationships_path(@person)
		else
			render 'new'
		end
	end

	def destroy
		@reporting_relationship = ReportingRelationship.find(params[:id])
		if @reporting_relationship.destroy
			flash[:success] = "Reporting Relationship has been deleted"
			redirect_to person_reporting_relationships_path(@person)
		end
	end

	private
	def get_person_id
		@person = Person.find(params[:person_id])
	end

	def reporting_relationship_params
		params.require(:reporting_relationship).permit(:person_id, :manager_id, :reporting_type)
	end
end
