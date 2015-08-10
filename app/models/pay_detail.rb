class PayDetail < ActiveRecord::Base
	belongs_to :person
	belongs_to :pay_grade
end
