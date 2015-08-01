class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :skill_description
      t.timestamps null: false
    end
  end
end
