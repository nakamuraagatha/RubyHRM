class DependentsController < ApplicationController
	before_action :get_person_id
	before_action :require_user

	add_breadcrumb "Employees", :people_path
	add_breadcrumb "Dependents", :person_dependents_path

	def index
		@dependents = @person.dependents
	end

	def show
		add_breadcrumb "View Dependent Details", :person_dependent_path

		@dependent = Dependent.find(params[:id])
	end

	def new
		add_breadcrumb "New Dependent", :new_person_dependent_path

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
		add_breadcrumb "Edit Dependent Details", :edit_person_dependent_path
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

