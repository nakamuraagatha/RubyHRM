class LanguagesController < ApplicationController
	before_action :set_language, only: [:edit, :update, :destroy]
	before_action :require_admin

	add_breadcrumb "Languages", :languages_path

	def index
		if params[:search]
			@languages = Language.search(params[:search])
		else
			@languages = Language.all
		end
	end

	def new
		add_breadcrumb "New Language", :new_language_path

		@language = Language.new
	end

	def create
		@language = Language.new(language_params)
		if @language.save
			flash[:success] = "Language has been successfully created"
			redirect_to languages_path
		end
	end

	def edit
		add_breadcrumb "Edit Language", :edit_language_path
	end

	def update
		if @language.update_attributes(language_params)
			flash[:success] = "Language has been successfully updated"
			redirect_to languages_path
		end
	end

	def destroy
		if @language.destroy
			flash[:success] = "Language has been successfully deleted"
			redirect_to languages_path
		end
	end

	private
	def set_language
		@language = Language.find(params[:id])
	end

	def language_params
		params.require(:language).permit(:language_description)
	end
end
