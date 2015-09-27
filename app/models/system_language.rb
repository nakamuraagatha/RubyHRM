class SystemLanguage < ActiveRecord::Base
	validates :language_code, presence: true
	validates :language_description, presence: 
	
	private
	def self.search(query)
		where("language_code ILIKE ? OR language_description ILIKE ?", "%#{query}%", "%#{query}%")
	end
end
