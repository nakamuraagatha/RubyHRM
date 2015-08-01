class EducationLevel < ActiveRecord::Base
	has_many :person_educations
end
