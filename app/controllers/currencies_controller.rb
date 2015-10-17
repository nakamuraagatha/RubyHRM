class CurrenciesController < ApplicationController
	before_action :set_currency, only: [:edit, :update, :destroy]
	before_action :require_admin

	  add_breadcrumb "Currencies", :currencies_path


	def index
		if params[:search]
			@currencies = Currency.search(params[:search]).limit(30)
		else
			@currencies = Currency.limit(30)
		end
		@count = @currencies.count
		@total_count = Currency.count
	end

	def new
	  	add_breadcrumb "New Currency", :new_currency_path

		@currency = Currency.new
	end

	def create
		@currency = Currency.new(currency_params)
		if @currency.save
			flash[:success] = "Currency Level has been successfully created"
			redirect_to currencies_path
		end
	end

	def edit
	  	add_breadcrumb "Edit Currency", :edit_currency_path
	end

	def update
		if @currency.update_attributes(currency_params)
			flash[:success] = "Currency has been successfully updated"
			redirect_to currencies_path
		end
	end

	def destroy
		if @currency.destroy
			flash[:success] = "Currency has been successfully deleted"
			redirect_to currencies_path
		end
	end

	private
		def set_currency
			@currency = Currency.find(params[:id])
		end

		def currency_params
			params.require(:currency).permit(:currency_code, :description)
		end
end

