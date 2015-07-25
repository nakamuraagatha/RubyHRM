class CreatePersonTerminations < ActiveRecord::Migration
  def change
    create_table :person_terminations do |t|
      t.integer :termination_reason_id
      t.date :termination_date
      t.text :note
      t.timestamps null: false
    end
  end
end
