class CreateJobDetails < ActiveRecord::Migration
  def change
    create_table :job_details do |t|
      t.integer :person_id
      t.date :start_date
      t.integer :job_title_id
      t.integer :departmet_id
      t.integer :location_id
      t.timestamps null: false
    end
  end
end
