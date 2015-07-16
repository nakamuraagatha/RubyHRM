class DeletePhoneNumbersFromPhoneNumbers < ActiveRecord::Migration
  def change
  	remove_column :phone_numbers, :phone_numbers
  	add_column :phone_numbers, :phone_number, :string
  end
end
