class CreateTextInstructions < ActiveRecord::Migration
  def change
    create_table :text_instructions do |t|
      t.string :key
      t.text :value

      t.timestamps null: false
    end
  end
end
