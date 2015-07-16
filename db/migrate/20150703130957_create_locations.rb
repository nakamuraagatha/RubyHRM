class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
   	  t.string :name
   	  t.string :address_line1
   	  t.string :address_line2
   	  t.string :city
   	  t.string :province
   	  t.string :postal
   	  t.string :country
   	  t.string :email_address
   	  t.string :phone_number
   	  t.string :fax_number

      t.timestamps null: false
    end
  end
end
