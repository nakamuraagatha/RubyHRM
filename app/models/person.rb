class Person < ActiveRecord::Base
	has_one :user
	has_one :job_title, class_name: "JobTitle", foreign_key: "id"
	has_one :department, class_name: "Department", foreign_key: "id"
	has_one :location, class_name: "Location", foreign_key: "id"
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
end
