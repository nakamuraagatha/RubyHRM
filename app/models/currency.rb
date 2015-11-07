class Currency < ActiveRecord::Base

	validates :currency_code, presence: true, length: {is: 3}
	validates :description, presence: true

	def currency_code_and_description
		[currency_code, description].join(" - ")
	end

	private
	def self.search(query)
		where("currency_code ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%")
	end
end
