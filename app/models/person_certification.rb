class PersonCertification < ActiveRecord::Base
	belongs_to :person
	belongs_to :certification
end
