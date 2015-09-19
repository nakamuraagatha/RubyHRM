class ChangePersonTerminationsToTerminations < ActiveRecord::Migration
  def change
  	rename_table :person_terminations, :terminations
  end
end
