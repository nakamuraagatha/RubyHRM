class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.integer :country_id
      t.string :state_code
      t.string :description
      t.timestamps null: false
    end
  end
end
