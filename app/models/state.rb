class State < ActiveRecord::Base
	belongs_to :country

	validates :country_id, presence: true
	validates :state_code, presence: true
	validates :description, presence: true
end
