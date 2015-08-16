class PersonCertification < ActiveRecord::Base
	belongs_to :person
	belongs_to :certification

	validates :certification_id, presence: true
end
