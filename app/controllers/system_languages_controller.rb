class SystemLanguagesController < ApplicationController
	before_action :require_admin
	before_action :set_system_language, only: [:edit, :update, :destroy]

	add_breadcrumb "System Languages", :system_languages_path


	def index
		if params[:search]
			@system_languages = SystemLanguage.search(params[:search])
		else
			@system_languages = SystemLanguage.all
		end
	end

	def new
		add_breadcrumb "New System Language", :new_system_language_path

		@system_language = SystemLanguage.new
	end

	def create
		@system_language = SystemLanguage.new(system_language_params)
		if @system_language.save
			flash[:success] = "System Language has been successfully added"
			redirect_to system_languages_path
		end
	end

	def edit
		add_breadcrumb "Edit System Language", :edit_system_language_path

	end

	def update
		if @system_language.update_attributes(system_language_params)
			flash[:success] = "System langauge has been successfully updated"
			redirect_to system_languages_path
		end
	end

	def destroy
		if @system_language.destroy
			flash[:success] = "System Language has been deleted"
			redirect_to system_languages_path
		end
	end

	private
		def set_system_language
			@system_language = SystemLanguage.find(params[:id])
		end

		def system_language_params
			params.require(:system_language).permit(:language_code, :language_description)
		end
end
