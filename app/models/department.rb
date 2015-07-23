class Department < ActiveRecord::Base
	has_many :people

	validates :name, presence: true
end
