class PayDetailsController < ApplicationController
	before_action :get_person_id
	before_action :require_user
	
	add_breadcrumb "Employees", :people_path
	add_breadcrumb "Pay Details", :person_pay_details_path

	def index
		@pay_details = @person.pay_details
	end

	def show
		add_breadcrumb "View Pay Details", :person_pay_detail_path

		@pay_detail = PayDetail.find(params[:id])
	end

	def new
		add_breadcrumb "New Pay Details", :new_person_pay_detail_path

		@pay_detail = PayDetail.new
	end

	def create
		@pay_detail = PayDetail.new(pay_detail_params)
		if @pay_detail.save
			flash[:success] = "Pay Component has been added"
			redirect_to person_pay_details_path(@person)
		else
			render 'new'
		end
	end

	def destroy
		@pay_detail = PayDetail.find(params[:id])
		if @pay_detail.destroy
			flash[:success] = "Pay Component has been deleted"
			redirect_to person_pay_details_path(@person)
		end
	end

	private
	def get_person_id
		@person = Person.find(params[:person_id])
	end

	def pay_detail_params
		params.require(:pay_detail).permit(:person_id, :pay_grade_id, :component_name, :pay_rate, :pay_frequency, :currency_code, :note)
	end
end
