class CreatePersonCertifications < ActiveRecord::Migration
  def change
    create_table :person_certifications do |t|
      t.integer :person_id
      t.integer :certification_id
      t.string :institute
      t.date :grant_date
      t.date :valid_thru_date
      t.timestamps null: false
    end
  end
end
