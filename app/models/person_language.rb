class PersonLanguage < ActiveRecord::Base
	belongs_to :person
	belongs_to :language

	validates :language_id, presence: true
end
