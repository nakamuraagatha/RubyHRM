class LocationsController < ApplicationController
    before_action :set_location, only: [:show, :edit, :update, :destroy]
    before_action :require_user
    
    add_breadcrumb I18n.t("page_header.locations"), :locations_path


    def index
        if params[:search]
            @locations = Location.search(params[:search])
        else
            @locations = Location.all
        end
        @count = @locations.count
        @total_count = Location.count
    end

    def new
        add_breadcrumb "New Location", :new_location_path

        @location = Location.new
    end

    def create
        @location = Location.new(location_params)
        if @location.save
            flash[:success] = "Location was successfully saved"
            redirect_to @location
        else
            render 'new'
        end
    end

    def show
        add_breadcrumb "View Location", :location_path
    end

    def edit
        add_breadcrumb "Edit Locations", :edit_location_path
    end

    def update
        if @location.update(location_params)
            flash[:success] = "Location was successfully updated"
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
