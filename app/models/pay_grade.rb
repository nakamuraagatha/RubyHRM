class PayGrade < ActiveRecord::Base
	has_many :pay_details

	validates :description, presence: true

	private
	def self.search(query)
		where("description ILIKE ?", "%#{query}%")
	end
end
