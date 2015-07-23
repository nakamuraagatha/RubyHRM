class TranslationsController < ApplicationController
	before_action :set_translation, only: [:show, :edit, :update, :destroy]
	before_action :require_admin

	def index
		@translations = Translation.all
	end

	def edit
	end

	def update
		if @translation.update(translation_params)
			flash[:success] = "Translation has been successfully updated"
			redirect_to translations_path
		else
			render 'edit'
		end
	end

	def new
		@translation = Translation.new
	end

	def create
		@translation = Translation.new(translation_params)
		if @translation.save
			flash[:success] = "Translation has been added"
			redirect_to translations_path
		else
			render 'new'
		end
	end

	def destroy
		if @translation.destroy
			flash[:success] = "Translation has been successfully deleted"
			redirect_to translations_path
		end
	end

	private
		def set_translation
			@translation = Translation.find(params[:id])
		end

		def translation_params
			params.require(:translation).permit(:locale, :key, :value, :interpolations, :is_proc)
		end
end
