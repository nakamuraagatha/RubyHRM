class PersonSkill < ActiveRecord::Base
	belongs_to :person
	belongs_to :skill

	validates :skill_id, presence: true
end
