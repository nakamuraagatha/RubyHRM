class EmergencyContactsController < ApplicationController
	before_action :require_user
	
	def new
		@emergency_contact = EmergencyContact.new
	end

	def create
		@emergency_contact = EmergencyContact.new(emergency_contact_params)
		if @emergency_contact.save
			flash[:notice] = "Emergency Contact has been added"
			redirect_to emergency_contact_details_path(@emergency_contact.person_id)
		else
			render 'new'
		end
	end

	def destroy
		@emergency_contact = EmergencyContact.find(params[:id])
		if @emergency_contact.destroy
			flash[:success] = "Emergency Contact has been deleted"
			redirect_to emergency_contact_details_path(@emergency_contact.person_id)
		end
	end

	private
		def emergency_contact_params
			params.require(:emergency_contact).permit(:person_id, :name, :relationship, :home_phone, :business_phone, :mobile_phone)
		end
end
