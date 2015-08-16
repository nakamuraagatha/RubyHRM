class Language < ActiveRecord::Base
	has_many :person_languages

	validates :language_description, presence: true
end
