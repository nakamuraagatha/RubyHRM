class AddPersonIdToEmergencyContacts < ActiveRecord::Migration
  def change
    add_column :emergency_contacts, :person_id, :integer
  end
end
