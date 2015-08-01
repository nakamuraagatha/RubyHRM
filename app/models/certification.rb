class Certification < ActiveRecord::Base
	has_many :person_certifications
end
