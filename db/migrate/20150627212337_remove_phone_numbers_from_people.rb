class RemovePhoneNumbersFromPeople < ActiveRecord::Migration
  def change
  	remove_column :people, :home_phone
  	remove_column :people, :mobile_phone
  	remove_column :people, :business_phone
  end
end
