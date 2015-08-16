class EducationLevel < ActiveRecord::Base
	has_many :person_educations

	validates :education_level_description, presence: true
end
