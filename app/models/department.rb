class Department < ActiveRecord::Base
	belongs_to :person, class_name: "Person", foreign_key: "department_id"
end
