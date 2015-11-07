class EmergencyContactsController < ApplicationController
	before_action :get_person_id
	before_action :require_user
	
	add_breadcrumb "Employees", :people_path
	add_breadcrumb "Emergency Contacts", :person_emergency_contacts_path

	def index
		@emergency_contacts = @person.emergency_contacts
	end

	def show
		add_breadcrumb "View Emergency Contact", :person_emergency_contact_path

		@emergency_contact = EmergencyContact.find(params[:id])
	end

	def new
		add_breadcrumb "New Emergency Contact", :new_person_emergency_contact_path

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

	def edit
		@emergency_contact = EmergencyContact.find(params[:id])
		add_breadcrumb "Edit Emergency Contact", :edit_person_emergency_contact_path
	end

	def update
		@emergency_contact = EmergencyContact.find(params[:id])
		if @emergency_contact.update_attributes(emergency_contact_params)
			flash[:success] = "Emergency Contact was successfully updated"
			redirect_to person_emergency_contacts_path(@person)
		else
			render 'edit'
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
