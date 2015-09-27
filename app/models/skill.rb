class Skill < ActiveRecord::Base
	has_many :person_skills

	validates :skill_description, presence: true

	private
	def self.search(query)
		where("skill_description ILIKE ?", "%#{query}%")
	end
end
