class AddPhoneAndEmailToPerson < ActiveRecord::Migration
  def change
    add_column :people, :home_phone, :string
    add_column :people, :mobile_phone, :string
    add_column :people, :business_phone, :string
    add_column :people, :home_email, :string
    add_column :people, :business_email, :string
  end
end
