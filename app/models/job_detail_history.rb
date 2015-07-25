class JobDetailHistory < ActiveRecord::Base
	belongs_to :person
	belongs_to :department
	belongs_to :job_title
	belongs_to :location
end
