class DropTablePhoneNumbersAndEmailAddresses < ActiveRecord::Migration
  def change
  	drop_table :email_addresses
  	drop_table :phone_numbers
  end
end
