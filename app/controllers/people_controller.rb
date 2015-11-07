class PeopleController < ApplicationController
	before_action :set_person, only: [:show, :show_contact_details, :show_job_details, :show_qualifications, :edit, :update, :edit_contact_details, :update_contact_details, :edit_job_details, :update_job_details]
	before_action :require_admin

	add_breadcrumb "Employees", :people_path

	def index
		if params[:search]
			@people = Person.search(params[:search]).order("employee_id ASC")
		else
			@people = Person.includes(:job_detail).all.order("employee_id ASC")
		end
	end

	def show
		add_breadcrumb "View Personal Details", :person_path
	end

	def show_qualifications
	end

	def new
		add_breadcrumb "New Employee", :new_person_path

		if Person.where(:id == 1).present?
			@id = 'EMP'.to_s + "#{sprintf '%04d', Person.maximum(:id).next}"
		else
			@id = 'EMP0001'
		end

		@person = Person.new
		@person.build_user
	end

	def create
		@person = Person.new(person_params)
		if @person.save
			flash[:success] = "Person was successfully created!"
			redirect_to edit_person_path(@person)
		else
			render "new"
		end
	end

	def edit
		add_breadcrumb "Edit Personal Details", :edit_person_path
	end

	def update
		if @person.update_attributes(person_params)
			flash[:success] = "Person was successfully updated!"
			redirect_to @person
		else
			render "edit"
		end
	end

	def destroy
		if @person.destroy
			flash[:success] = "Person was successfully deleted!"
			redirect_to people_path
		end

	end

	private
		def set_person
			@person = Person.find(params[:id])
		end

		def person_params
			params.require(:person).permit(:employee_id, 
										   	:first_name, 
										   	:middle_name, 
										   	:last_name, 
										   	:preferred_first, 
										   	:name_suffix, 
										   	:national_id, 
										   	:gender, 
										   	:date_of_birth, 
										   	:nationality, 
										   	:marital_status, 
										   	:military_status, 
										   	:ethnicity, 
										   	:smoker, 
										   	:disabled, 
										   	:address_line1, 
										   	:address_line2, 
										   	:city, 
										   	:province, 
										   	:postal, 
										   	:country, 
										   	:home_phone, 
										   	:mobile_phone, 
										   	:business_phone, 
										   	:home_email, 
										   	:business_email,
										   	:photo, 
										   	user_attributes: [:username, 
										   					 	:password, 
										   					 	:password_confirmation, 
										   					 	:role
										   						], 
										  	)
		end
end
