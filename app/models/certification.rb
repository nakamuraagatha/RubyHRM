class Certification < ActiveRecord::Base
	has_many :person_certifications

	validates :certification_description, presence: true
end
