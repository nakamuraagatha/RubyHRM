class AddContactInfoToPerson < ActiveRecord::Migration
  def change
  	add_column :people, :address_line1, :string
  	add_column :people, :address_line2, :string
  	add_column :people, :city, :string
  	add_column :people, :province, :string
  	add_column :people, :postal, :string
  	add_column :people, :country, :string
  	add_column :people, :home_phone, :string
  	add_column :people, :mobile_phone, :string
  	add_column :people, :business_phone, :string
  	add_column :people, :home_email, :string
  	add_column :people, :business_email, :string
  end
end
