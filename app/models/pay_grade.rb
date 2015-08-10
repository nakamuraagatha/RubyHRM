class PayGrade < ActiveRecord::Base
	has_many :pay_details

	validates :description, presence: true
end
