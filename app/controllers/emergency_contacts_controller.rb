class EmergencyContactsController < ApplicationController
	before_filter :get_person_id
	before_action :require_user
	
	def index
		@emergency_contacts = @person.emergency_contacts
	end

	def show
		@emergency_contact = EmergencyContact.find(params[:id])
	end

	def new
		@emergency_contact = EmergencyContact.new
	end

	def create
		@emergency_contact = EmergencyContact.new(emergency_contact_params)
		if @emergency_contact.save
			flash[:success] = "Emergency Contact has been added"
			redirect_to person_emergency_contacts_path(@person)
		else
			render 'new'
		end
	end

	def destroy
		@emergency_contact = EmergencyContact.find(params[:id])
		if @emergency_contact.destroy
			flash[:success] = "Emergency Contact has been deleted"
			redirect_to person_emergency_contacts_path(@person)
		end
	end

	private
		def get_person_id
			@person = Person.find(params[:person_id])
		end

		def emergency_contact_params
			params.require(:emergency_contact).permit(:person_id, :name, :relationship, :home_phone, :business_phone, :mobile_phone)
		end
end
