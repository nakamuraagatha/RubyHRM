class CreateContactDetails < ActiveRecord::Migration
  def change
    create_table :contact_details do |t|
      t.integer :person_id
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :postal
      t.string :country
      t.string :home_phone
      t.string :mobile_phone
      t.string :business_phone
      t.string :home_email
      t.string :business_email
      t.timestamps null: false
    end
  end
end
