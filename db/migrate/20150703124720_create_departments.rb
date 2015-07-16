class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :department_number
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
