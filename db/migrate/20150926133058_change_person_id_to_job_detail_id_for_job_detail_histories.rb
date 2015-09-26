class ChangePersonIdToJobDetailIdForJobDetailHistories < ActiveRecord::Migration
  def change
  		rename_column :job_detail_histories, :person_id, :job_detail_id
  end
end
