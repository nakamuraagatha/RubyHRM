class Termination < ActiveRecord::Base
	belongs_to :person
	belongs_to :terminatoion_reason

	validates :termination_reason_id, presence: true
	validates :termination_date, presence: true
end
