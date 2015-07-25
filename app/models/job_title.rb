class JobTitle < ActiveRecord::Base
	has_many :people
	has_many :job_detail_histories

	validates :job_title, presence: true
end
