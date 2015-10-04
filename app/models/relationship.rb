class Relationship < ActiveRecord::Base
	validates :description, presence: true

	private
	def self.search(query)
		where("description ILIKE ?", "%#{query}%")
	end
end
