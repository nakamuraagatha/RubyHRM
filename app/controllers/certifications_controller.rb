class CertificationsController < ApplicationController
	before_action :set_certification, only: [:edit, :update, :destroy]
	before_action :require_admin

	  add_breadcrumb "Certifications", :certifications_path


	def index
		if params[:search]
			@certifications = Certification.search(params[:search])
		else
			@certifications = Certification.all
		end
	end

	def new
	  	add_breadcrumb "New Certification", :new_certification_path

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
	  	add_breadcrumb "Edit Certification", :edit_certification_path
	end

	def update
		if @certification.update_attributes(certification_params)
			flash[:success] = "Certification has been successfully updated"
			redirect_to certifications_path
		end
	end

	def destroy
		if @certification.destroy
			flash[:success] = "Certification has been successfully deleted"
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
