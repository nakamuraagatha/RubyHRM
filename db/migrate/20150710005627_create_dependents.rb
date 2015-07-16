class CreateDependents < ActiveRecord::Migration
  def change
    create_table :dependents do |t|
      t.integer :person_id
      t.string :name
      t.string :relationship
      t.date :date_of_birth
      t.timestamps null: false
    end
  end
end
