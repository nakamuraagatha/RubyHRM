class Person < ActiveRecord::Base
	has_one :user
	belongs_to :job_title
	belongs_to :department
	belongs_to :location
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

	def self.search(query)
		where("first_name ILIKE ? OR last_name ILIKE ? OR preferred_first ILIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
	end
end
