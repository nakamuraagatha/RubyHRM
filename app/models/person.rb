class Person < ActiveRecord::Base
	after_create :add_job_detail
	after_create :add_contact_detail
	after_create :set_employee_id

	has_attached_file :photo, styles: {small: "15x15#", medium: "40x40#", large: "150x150#"}, default_url: "/images/missing_:style.png"
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	has_one :user
	has_one :job_detail
	has_one :job_title, :through => :job_detail
	has_one :department, :through => :job_detail
	has_one :location, :through => :job_detail
	has_one :contact_detail
	has_one :termination
	has_many :phone_numbers
	has_many :email_addresses
	has_many :pay_details
	has_many :reporting_relationships
	has_many :managers, :through => :reporting_relationships
	has_many :emergency_contacts
	has_many :dependents
	has_many :person_skills
	has_many :person_certifications
	has_many :person_educations
	has_many :person_languages

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :gender, presence: true, :on => :edit
	validates :date_of_birth, presence: true, :on => :edit

	accepts_nested_attributes_for :user, :reject_if => :all_blank

	def full_name
		self.preferred_first.present? ? "#{preferred_first} #{last_name}" : "#{first_name} #{last_name}"
	end

	#After the person is saved, create a job detail record with the person ID.
	def add_job_detail
		JobDetail.create(person_id: self.id, start_date: DateTime.now.to_date)
	end
	
	#After the person is saved, create a contact detail record with the person ID.
	def add_contact_detail
		ContactDetail.create(person_id: self.id)
	end

	#After the person is saved, update the employee ID to the correct ID that was created. 
	#Solves issues with mutliple people enering a person at the same time getting the same employee ID
	def set_employee_id
		self.update_attributes(employee_id: 'EMP'.to_s + "#{sprintf '%04d', self.id}")
	end

	def active?
		Termination.find_by_person_id(self.id).nil?
	end

	private
	def self.search(query)
		where("first_name ILIKE ? OR last_name ILIKE ? OR preferred_first ILIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
	end
end