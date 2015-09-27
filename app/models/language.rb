class Language < ActiveRecord::Base
	has_many :person_languages

	validates :language_description, presence: true

	private
	def self.search(query)
		where("language_description ILIKE ?", "%#{query}%")
	end
end
