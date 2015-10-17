class SearchesController < ApplicationController
  add_breadcrumb "Search Results", :searches_path


  def index
  	if params[:global_search].present?
  		@people = Person.search(params[:global_search])
	  	@users = User.search(params[:global_search])
	  	@departments = Department.search(params[:global_search])
	  	@job_titles = JobTitle.search(params[:global_search])
	  	@locations = Location.search(params[:global_search])

	  	@search_results = @people + @users + @departments + @job_titles + @locations 
	else
		@search_results = Array.new
	end
  end
end
