class Country < ActiveRecord::Base
	has_many :states

	validates :country_code, presence: true
	validates :description, presence: true

	private
	def self.search(query)
		where("country_code ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%")
	end
end
