class DropContactDetails < ActiveRecord::Migration
  def change
  	drop_table :contact_details
  	drop_table :job_details
  end
end
