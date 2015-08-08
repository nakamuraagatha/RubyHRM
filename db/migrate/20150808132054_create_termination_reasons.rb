class CreateTerminationReasons < ActiveRecord::Migration
  def change
    create_table :termination_reasons do |t|
      t.string :description
      t.timestamps null: false
    end
  end
end
