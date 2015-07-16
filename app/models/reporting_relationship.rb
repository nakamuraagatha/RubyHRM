class ReportingRelationship < ActiveRecord::Base
	belongs_to :person
	belongs_to :manager, class_name: "Person"
end
