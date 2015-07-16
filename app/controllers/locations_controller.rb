class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:notice] = "Location was successfully saved"
      redirect_to @location
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @location.update(location_params)
      flash[:notice] = "Location was successfully updated"
      redirect_to @location
    else
      render 'edit'
    end
  end

  def destroy
    @location.destroy
  end


  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :address_line1, :address_line2, :city, :province, :postal, :country, :email_address, :phone_number, :fax_number)
    end
end
