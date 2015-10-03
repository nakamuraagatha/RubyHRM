class TerminationReasonsController < ApplicationController
	before_action :set_termination_reason, only: [:edit, :update, :destroy]
	before_action :require_admin

	add_breadcrumb "Termination Reasons", :termination_reasons_path

	def index
		if params[:search]
			@termination_reasons = TerminationReason.search(params[:search])
		else
			@termination_reasons = TerminationReason.all
		end
	end

	def new
		add_breadcrumb "New Termination Reason", :new_termination_reason_path

		@termination_reason = TerminationReason.new
	end

	def create
		@termination_reason = TerminationReason.new(termination_reason_params)
		if @termination_reason.save
			flash[:success] = "Termination Reason has been successfully created"
			redirect_to termination_reasons_path
		end
	end

	def edit
		add_breadcrumb "Edit Termination Reason", :edit_termination_reason_path
	end

	def update
		if @termination_reason.update_attributes(termination_reason_params)
			flash[:success] = "Termination Reason has been successfully updated"
			redirect_to termination_reasons_path
		end
	end

	def destroy
		if @termination_reason.destroy
			flash[:success] = "Termination Reason has been successfully deleted"
			redirect_to termination_reasons_path
		end
	end

	private
		def set_termination_reason
			@termination_reason = TerminationReason.find(params[:id])
		end

		def termination_reason_params
			params.require(:termination_reason).permit(:description)
		end
end
