class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :preferred_first
      t.string :national_id
      t.string :gender
      t.date :date_of_birth
      t.string :nationality
      t.string :marital_status
      t.string :military_status
      t.boolean :smoker
      t.timestamps null: false
    end
  end
end
