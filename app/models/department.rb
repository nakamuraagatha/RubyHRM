class Department < ActiveRecord::Base
	has_many :people
end
