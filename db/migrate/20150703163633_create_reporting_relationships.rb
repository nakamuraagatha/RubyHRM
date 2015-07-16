class CreateReportingRelationships < ActiveRecord::Migration
  def change
    create_table :reporting_relationships do |t|
      t.integer :person_id
      t.integer :manager_id
      t.string :reporting_type

      t.timestamps null: false
    end
  end
end
