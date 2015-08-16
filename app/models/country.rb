class Country < ActiveRecord::Base
	has_many :states

	validates :country_code, presence: true
	validates :description, presence: true
end
