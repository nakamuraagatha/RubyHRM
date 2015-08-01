class SystemLanguage < ActiveRecord::Base
	validates :language_code, presence: true
	validates :language_description, presence: true
end
