class PayDetailsController < ApplicationController
	before_action :require_user
	
	def show
		@pay_detail = PayDetail.find(params[:id])
	end

	def new
		@pay_detail = PayDetail.new
	end

	def create
		@pay_detail = PayDetail.new(pay_detail_params)
		if @pay_detail.save
			flash[:notice] = "Pay Component has been added"
			redirect_to show_pay_details_path(@pay_detail.person_id)
		else
			render 'new'
		end
	end

	def destroy
		@pay_detail = PayDetail.find(params[:id])
		if @pay_detail.destroy
			flash[:success] = "Pay Component has been deleted"
			redirect_to show_pay_details_path(@pay_detail.person_id)
		end
	end

	private
		def pay_detail_params
			params.require(:pay_detail).permit(:person_id, :pay_grade_id, :component_name, :pay_rate, :pay_frequency, :currency_code, :note)
		end
end
