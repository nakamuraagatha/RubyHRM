class DependentsController < ApplicationController
	def new
		@dependent = Dependent.new
	end

	def create
		@dependent = Dependent.new(dependent_params)
		if @dependent.save
			flash[:notice] = "Dependent has been added"
			redirect_to dependent_details_path(@dependent.person_id)
		else
			render 'new'
		end
	end

	def destroy
		@dependent = Dependent.find(params[:id])
		@dependent.destroy
	end

	private
		def dependent_params
			params.require(:dependent).permit(:person_id, :name, :relationship, :date_of_birth)
		end
end

