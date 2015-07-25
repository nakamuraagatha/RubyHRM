class CreateJobDetailHistories < ActiveRecord::Migration
  def change
    create_table :job_detail_histories do |t|
      t.integer :person_id
      t.date :change_date
      t.integer :job_title_id
      t.integer :department_id
      t.integer :location_id
      t.timestamps null: false
    end
  end
end
