class CreateEmergencyContacts < ActiveRecord::Migration
  def change
    create_table :emergency_contacts do |t|
      t.string :name
      t.string :relationship
      t.string :home_phone
      t.string :business_phone
      t.string :mobile_phone
      t.timestamps null: false
    end
  end
end
