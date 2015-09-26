class JobDetailHistory < ActiveRecord::Base
	belongs_to :job_detail
	belongs_to :department
	belongs_to :job_title
	belongs_to :location
end
