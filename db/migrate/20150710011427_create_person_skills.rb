class CreatePersonSkills < ActiveRecord::Migration
  def change
    create_table :person_skills do |t|
      t.integer :person_id
      t.string :skill_id
      t.string :years_experience
      t.text :note

      t.timestamps null: false
    end
  end
end
