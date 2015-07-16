class AddDisabilityStatusToPerson < ActiveRecord::Migration
  def change
    add_column :people, :disabled, :boolean
  end
end
