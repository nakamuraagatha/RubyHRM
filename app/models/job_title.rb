class JobTitle < ActiveRecord::Base
	belongs_to :person, class_name: "Person", foreign_key: "job_title_id"
end
