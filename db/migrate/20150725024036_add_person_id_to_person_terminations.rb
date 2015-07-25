class AddPersonIdToPersonTerminations < ActiveRecord::Migration
  def change
    add_column :person_terminations, :person_id, :integer
  end
end
