class CreateEducationLevels < ActiveRecord::Migration
  def change
    create_table :education_levels do |t|
      t.string :education_level_description
      t.timestamps null: false
    end
  end
end
