class CertificationsController < ApplicationController
	before_action :set_certification, only: [:edit, :update, :destroy]
	before_action :require_admin

	def index
		if params[:search]
			@certifications = Certification.search(params[:search])
		else
			@certifications = Certification.all
		end
	end

	def new
		@certification = Certification.new
	end

	def create
		@certification = Certification.new(certification_params)
		if @certification.save
			flash[:success] = "Certification Level has been successfully created"
			redirect_to certifications_path
		end
	end

	def edit

	end

	def update
		if @certification.update_attributes(certification_params)
			flash[:success] = "Certification has been successfully updated"
			redirect_to certifications_path
		end
	end

	def destroy
		if @certification.destroy
			flash[:success] = "Certification Level has been successfully deleted"
			redirect_to certifications_path
		end
	end

	private
		def set_certification
			@certification = Certification.find(params[:id])
		end

		def certification_params
			params.require(:certification).permit(:certification_description)
		end
end
