class RemoveJobDetailsFromPerson < ActiveRecord::Migration
  def change
  	remove_column :people, :job_title_id
  	remove_column :people, :department_id
  	remove_column :people, :location_id
  	remove_column :people, :start_date
  end
end
