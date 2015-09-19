class TerminationReason < ActiveRecord::Base
	has_many :terminations

	validates :description, presence: true
end
