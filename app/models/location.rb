class Location < ActiveRecord::Base
	has_many :people
	has_many :job_details
	has_many :job_detail_histories

	validates :name, presence: true
end
