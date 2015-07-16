class CreateJobTitles < ActiveRecord::Migration
  def change
    create_table :job_titles do |t|
      t.string :job_title
      t.text :job_description

      t.timestamps null: false
    end
  end
end
