class PersonEducation < ActiveRecord::Base
	belongs_to :person
	belongs_to :education_level
end
