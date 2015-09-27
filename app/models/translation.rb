class Translation < ActiveRecord::Base
	validates :locale, presence: true
	validates :key, presence: true
	validates :value, presence: true

	private
	def self.search(query1, query2)
		where("locale ILIKE ? AND (value ILIKE (?) OR key ILIKE (?))", "%#{query1}%", "%#{query2}%", "%#{query2}%")
	end
end
