class AddJobDetailsToPeeopl < ActiveRecord::Migration
  def change
  	add_column :people, :job_title_id, :integer
  	add_column :people, :start_date, :date
  	add_column :people, :department_id, :integer
  	add_column :people, :location_id, :integer
  	remove_column :people, :home_email
  	remove_column :people, :business_email
  end
end
