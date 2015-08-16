class PayDetail < ActiveRecord::Base
	belongs_to :person
	belongs_to :pay_grade

	validates :component_name, presence: true
	validates :pay_rate, presence: true
	validates :pay_frequency, presence: true
end
