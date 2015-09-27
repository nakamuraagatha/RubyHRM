class State < ActiveRecord::Base
	belongs_to :country

	validates :country_id, presence: true
	validates :state_code, presence: true
	validates :description, presence: true

	private
	def self.search(query)
		where("state_code ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%")
	end
end
