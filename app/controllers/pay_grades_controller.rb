class PayGradesController < ApplicationController
	before_action :set_pay_grade, only: [:show, :edit, :update, :destroy]
	before_action :require_admin


  	add_breadcrumb "Pay Grades", :pay_grades_path

	def index
		if params[:search]
			@pay_grades = PayGrade.search(params[:search])
		else
			@pay_grades = PayGrade.all
		end
		@count = @pay_grades.count
		@total_count = PayGrade.count
	end

	def new
  		add_breadcrumb "New Pay Grade", :new_pay_grade_path

		@pay_grade = PayGrade.new
	end

	def create
		@pay_grade = PayGrade.new(pay_grade_params)
		if @pay_grade.save
			flash[:success] = "Pay Grade has been successfully created"
			redirect_to pay_grades_path
		else
			render "new"
		end
	end

	def show
        add_breadcrumb "View Pay Grade", :location_path
    end

	def edit
  		add_breadcrumb "Edit Pay Grade", :edit_pay_grade_path
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
