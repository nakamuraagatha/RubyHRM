class CreatePersonLanguages < ActiveRecord::Migration
  def change
    create_table :person_languages do |t|
      t.integer :person_id
      t.integer :language_id
      t.string :reading_proficiency
      t.string :writing_proficiency
      t.string :speaking_proficiency
      t.timestamps null: false
    end
  end
end
