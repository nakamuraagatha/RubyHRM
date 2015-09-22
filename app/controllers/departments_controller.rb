class DepartmentsController < ApplicationController

  before_action :set_department, only: [:show, :edit, :update, :destroy]
  before_action :require_user

  def index
    if params[:search]
      @departments = Department.search(params[:search])
    else
      @departments = Department.all
    end
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      flash[:success] = "Department was successfully saved"
      redirect_to @department
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @department.update(department_params)
      flash[:success] = "Department was successfully updated"
      redirect_to @department
    else
      render 'edit'
    end
  end

  def destroy
    @department.destroy
  end


  private
    def set_department
      @department = Department.find(params[:id])
    end

    def department_params
      params.require(:department).permit(:department_number, :name, :description)
    end
end
