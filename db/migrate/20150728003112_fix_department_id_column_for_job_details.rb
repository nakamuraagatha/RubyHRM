class FixDepartmentIdColumnForJobDetails < ActiveRecord::Migration
  def change
  	rename_column :job_details, :departmet_id, :department_id
  end
end
