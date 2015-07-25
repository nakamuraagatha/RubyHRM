class Translation < ActiveRecord::Base

	private
		def self.search(query1, query2)
			where("locale ILIKE ? AND (value ILIKE (?) OR key ILIKE (?))", "%#{query1}%", "%#{query2}%", "%#{query2}%")
		end
end
