class DependentsController < ApplicationController
	before_action :require_user

	def show 
		@dependent = Dependent.find(params[:id])
	end

	def new
		@dependent = Dependent.new
		@person_id = params[:person_id]
	end

	def create
		@dependent = Dependent.new(dependent_params)
		@person_id = @dependent.person_id
		if @dependent.save
			flash[:success] = "Dependent has been added"
			redirect_to dependent_details_path(@dependent.person_id)
		else	
			render 'new', :person_id => @person_id
		end
	end

	def edit
	end

	def update
		if @dependent.update_attributes(dependent_params)
			flash[:success] = "Dependent was successfully updated!"
			redirect_to dependent_details_path(@dependent.person_id)
		else
			render "edit"
		end
	end

	def destroy
		@dependent = Dependent.find(params[:id])
		if @dependent.destroy
			flash[:success] = "Dependent has been deleted"
			redirect_to dependent_details_path(@dependent.person_id)
		end
	end

	private
		def dependent_params
			params.require(:dependent).permit(:person_id, :name, :relationship, :date_of_birth)
		end
end

