class SearchesController < ApplicationController
  def index
  	if params[:search].present?
  		@people = Person.search(params[:search])
	  	@users = User.search(params[:search])
	  	@departments = Department.search(params[:search])
	  	@job_titles = JobTitle.search(params[:search])
	  	@locations = Location.search(params[:search])

	  	@search_results = @people + @users + @departments + @job_titles + @locations 
	else
		@search_results = Array.new
	end

  	
  end
end
