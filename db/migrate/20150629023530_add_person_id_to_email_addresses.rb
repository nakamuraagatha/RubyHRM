class AddPersonIdToEmailAddresses < ActiveRecord::Migration
  def change
    add_column :email_addresses, :person_id, :integer
  end
end
