class CountriesController < ApplicationController
	before_action :set_country, only: [:edit, :update, :destroy]
	before_action :require_admin

	def index
		if params[:search]
			@countries = Country.search(params[:search])
		else
			@countries = Country.all
		end
	end

	def new
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
