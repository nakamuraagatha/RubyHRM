class JobDetail < ActiveRecord::Base
	include ActiveModel::Dirty

	before_update :insert_job_history

	belongs_to :person
	belongs_to :job_title
	belongs_to :location
	belongs_to :department
	has_many :job_detail_histories

	validates :job_title_id, presence: true, :on => :edit

	private
		def insert_job_history
			if self.job_title_id_changed? || self.department_id_changed? || self.location_id_changed?
				unless self.job_title_id_was.nil? & self.department_id_was.nil? & self.location_id_was.nil?
					JobDetailHistory.create(job_detail_id: self.id, change_date: Date.today, job_title_id: self.job_title_id_was, department_id: self.department_id_was, location_id: self.location_id_was)
				end
			end
		end
end
