class Certification < ActiveRecord::Base
	has_many :person_certifications

	validates :certification_description, presence: true

	private
	def self.search(query)
		where("certification_description ILIKE ?", "%#{query}%")
	end
end
