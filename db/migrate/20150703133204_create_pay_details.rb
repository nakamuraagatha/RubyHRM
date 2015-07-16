class CreatePayDetails < ActiveRecord::Migration
  def change
    create_table :pay_details do |t|
  	  t.string :person_id
  	  t.string :component_name
  	  t.decimal :pay_rate
  	  t.string :pay_frequency
  	  t.string :currency_code
  	  t.text :note

      t.timestamps null: false
    end
  end
end
