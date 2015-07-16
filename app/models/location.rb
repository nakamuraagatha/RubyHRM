class Location < ActiveRecord::Base
	belongs_to :person, class_name: "Person", foreign_key: "location_id"
end
