class LanguagesController < ApplicationController
	before_action :set_language, only: [:edit, :update, :destroy]
	before_action :require_admin

	def index
		@languages = Language.all
	end

	def new
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
