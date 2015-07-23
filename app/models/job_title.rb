class JobTitle < ActiveRecord::Base
	has_many :people

	validates :job_title, presence: true
end
