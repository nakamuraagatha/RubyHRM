class EducationLevel < ActiveRecord::Base
	has_many :person_educations

	validates :education_level_description, presence: true

	private
	def self.search(query)
		where("education_level_description ILIKE ?", "%#{query}%")
	end
end
