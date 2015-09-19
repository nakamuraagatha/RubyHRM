class RemoveFieldsFromPeople < ActiveRecord::Migration
  def change
  	remove_column :people, :address_line1
  	remove_column :people, :address_line2
	remove_column :people, :city
	remove_column :people, :province
	remove_column :people, :postal
	remove_column :people, :country
	remove_column :people, :home_phone
	remove_column :people, :mobile_phone
	remove_column :people, :business_phone
	remove_column :people, :home_email
	remove_column :people, :business_email
  end
end
