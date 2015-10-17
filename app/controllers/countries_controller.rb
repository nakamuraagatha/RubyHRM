class CountriesController < ApplicationController
	before_action :set_country, only: [:edit, :update, :destroy]
	before_action :require_admin

    add_breadcrumb "Countries", :countries_path


	def index
		if params[:search]
			@countries = Country.search(params[:search]).limit(30)
		else
			@countries = Country.limit(30)
		end
		@count = @countries.count
		@total_count = Country.count
	end

	def new
		add_breadcrumb "New Country", :new_country_path

		@country = Country.new
	end

	def create
		@country = Country.new(country_params)
		if @country.save
			flash[:success] = "Country has been successfully created"
			redirect_to countries_path
		end
	end

	def edit
		add_breadcrumb "Edit Country", :edit_country_path
	end

	def update
		if @country.update_attributes(country_params)
			flash[:success] = "Country has been successfully updated"
			redirect_to countries_path
		end
	end

	def destroy
		if @country.destroy
			flash[:success] = "Country Level has been successfully deleted"
			redirect_to countries_path
		end
	end

	private
		def set_country
			@country = Country.find(params[:id])
		end

		def country_params
			params.require(:country).permit(:country_code, :description)
		end
end
