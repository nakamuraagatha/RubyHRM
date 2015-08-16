class Skill < ActiveRecord::Base
	has_many :person_skills

	validates :skill_description, presence: true
end
