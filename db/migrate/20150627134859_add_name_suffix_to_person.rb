class AddNameSuffixToPerson < ActiveRecord::Migration
  def change
    add_column :people, :name_suffix, :string
  end
end
