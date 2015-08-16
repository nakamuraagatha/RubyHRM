class PersonEducation < ActiveRecord::Base
	belongs_to :person
	belongs_to :education_level

	validates :education_level_id, presence: true
end
