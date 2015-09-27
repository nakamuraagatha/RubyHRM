class TerminationReason < ActiveRecord::Base
	has_many :terminations

	validates :description, presence: 

	private
	def self.search(query)
		where("description ILIKE ?", "%#{query}%")
	end
end
