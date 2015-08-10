class PayGradesController < ApplicationController
	before_action :set_pay_grade, only: [:edit, :update, :destroy]
	before_action :require_admin

	def index
		@pay_grades = PayGrade.all
	end

	def new
		@pay_grade = PayGrade.new
	end

	def create
		@pay_grade = PayGrade.new(pay_grade_params)
		if @pay_grade.save
			flash[:success] = "Pay Grade has been successfully created"
			redirect_to pay_grades_path
		end
	end

	def edit

	end

	def update
		if @pay_grade.update_attributes(pay_grade_params)
			flash[:success] = "Pay Grade has been successfully updated"
			redirect_to pay_grades_path
		end
	end

	def destroy
		if @pay_grade.destroy
			flash[:success] = "Pay Grade has been successfully deleted"
			redirect_to pay_grades_path
		end
	end

	private
		def set_pay_grade
			@pay_grade = PayGrade.find(params[:id])
		end

		def pay_grade_params
			params.require(:pay_grade).permit(:description, :minimum, :maximum, :currency_code)
		end
end
