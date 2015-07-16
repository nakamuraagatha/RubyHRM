class PersonLanguagesController < ApplicationController
	def new
		@person_language = PersonLanguage.new
	end

	def create
		@person_language = PersonLanguage.new(person_language_params)
		if @person_language.save
			flash[:notice] = "Language has been added"
			redirect_to qualifications_path(@person_language.person_id)
		else
			render 'new'
		end
	end

	def destroy
		@person_language = PersonLanguage.find(params[:id])
		@person_language.destroy
	end

	private
		def person_language_params
			params.require(:person_language).permit(:person_id, :language_id, :reading_proficiency, :writing_proficiency, :speaking_proficiency)
		end
end
