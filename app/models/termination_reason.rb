class TerminationReason < ActiveRecord::Base
	has_many :person_terminations

	validates :description, presence: true
end
