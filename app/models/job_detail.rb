class JobDetail < ActiveRecord::Base
	include ActiveModel::Dirty

	before_update :insert_job_history

	belongs_to :person
	belongs_to :job_title
	belongs_to :location
	belongs_to :department

	validates :job_title_id, presence: true, :on => :edit

	private
		def insert_job_history
			if self.job_title_id_changed? || self.department_id_changed? || self.location_id_changed?
				JobDetailHistory.create(person_id: self.id, change_date: Date.today, job_title_id: self.job_title_id_was, department_id: self.department_id_was, location_id: self.location_id_was)
			end
		end
end
