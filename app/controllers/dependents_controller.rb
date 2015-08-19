class DependentsController < ApplicationController
	before_filter :get_person_id
	before_action :require_user

	def index
		@dependents = @person.dependents
	end

	def show 
		@dependent = Dependent.find(params[:id])
	end

	def new
		@dependent = Dependent.new
	end

	def create
		@dependent = Dependent.new(dependent_params)
		if @dependent.save
			flash[:success] = "Dependent has been added"
			redirect_to person_dependents_path(@person)
		else	
			render 'new'
		end
	end

	def edit
	end

	def update
		if @dependent.update_attributes(dependent_params)
			flash[:success] = "Dependent was successfully updated"
			redirect_to person_dependents_path(@person)
		else
			render 'edit'
		end
	end

	def destroy
		@dependent = Dependent.find(params[:id])
		if @dependent.destroy
			flash[:success] = "Dependent has been deleted"
			redirect_to person_dependents_path(@person)
		end
	end

	private
	def get_person_id
		@person = Person.find(params[:person_id])
	end
	
	def dependent_params
		params.require(:dependent).permit(:person_id, :name, :relationship, :date_of_birth)
	end
end

