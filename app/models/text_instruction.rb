class TextInstruction < ActiveRecord::Base
	validates :key, presence: true
	validates :value, presence: true


	private
	def self.search(query)
		where("key ILIKE ? OR value ILIKE ?", "%#{query}%", "%#{query}%")
	end
end
