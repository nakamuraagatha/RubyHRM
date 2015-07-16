class CreatePersonEducations < ActiveRecord::Migration
  def change
    create_table :person_educations do |t|
      t.integer :person_id
      t.integer :education_level_id
      t.string :institute
      t.date :start_date
      t.date :completed_date
      t.timestamps null: false
    end
  end
end
