class DeletePhoneTypeFromPhoneNumbers < ActiveRecord::Migration
  def change
  	remove_column :phone_numbers, :type
  	add_column :phone_numbers, :phone_type, :string
  end
end
