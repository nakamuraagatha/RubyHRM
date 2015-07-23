class PersonLanguagesController < ApplicationController
	def new
		@person_language = PersonLanguage.new
	end

	def create
		@person_language = PersonLanguage.new(person_language_params)
		if @person_language.save
			flash[:success] = "Language has been added"
			redirect_to qualifications_path(@person_language.person_id)
		else
			render 'new'
		end
	end

	def destroy
		@person_language = PersonLanguage.find(params[:id])
		if @person_language.destroy
			flash[:success] = "Language has been deleted"
			redirect_to qualifications_path(@person_language.person_id)
		end
	end

	private
		def person_language_params
			params.require(:person_language).permit(:person_id, :language_id, :reading_proficiency, :writing_proficiency, :speaking_proficiency)
		end
end
