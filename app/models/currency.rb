class Currency < ActiveRecord::Base

	validates :currency_code, presence: true
	validates :description, presence: true

	private
	def self.search(query)
		where("currency_code ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%")
	end
end
