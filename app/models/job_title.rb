class JobTitle < ActiveRecord::Base
	has_many :job_details
	has_many :job_detail_histories

	validates :job_title, presence: true

	private
	def self.search(query)
		where("job_title ILIKE ?", "%#{query}%")
	end
end
