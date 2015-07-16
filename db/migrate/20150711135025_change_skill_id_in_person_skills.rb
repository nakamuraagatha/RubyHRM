class ChangeSkillIdInPersonSkills < ActiveRecord::Migration
  def change
  	change_column :person_skills, :skill_id, :integer
  end
end
