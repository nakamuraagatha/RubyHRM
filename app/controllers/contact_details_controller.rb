class ContactDetailsController < ApplicationController
	before_action :get_person_id
	before_action :set_contact_detail, only: [:show, :edit, :update]
	before_action :require_admin

	def show
	end

	def new
		@contact_detail = ContactDetail.new
	end

	def create
		@contact_detail = ContactDetail.new(contact_detail_params)
		if @contact_detail.save
			flash[:success] = "Contact Details have been successfully created"
			redirect_to person_contact_detail_path(@person)
		else 
			render "new"
		end
	end

	def edit
	end

	def update
		if @contact_detail.update_attributes(contact_detail_params)
			flash[:success] = "Contact Details have been successfully updated"
			redirect_to person_contact_detail_path(@person, @person.id)
		else 
			render "edit"
		end
	end

	private
	def set_contact_detail
		@contact_detail = ContactDetail.find_by_person_id(@person.id)
	end

	def get_person_id
		@person = Person.find(params[:person_id])
	end

	def contact_detail_params
		params.require(:contact_detail).permit(:person_id, :address_line1, :address_line2, :city, :state, :postal, :country, :home_phone, :mobile_phone, :business_phone, :home_email, :business_email)
	end
end
