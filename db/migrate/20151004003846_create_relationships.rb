class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :description
      t.timestamps null: false
    end
  end
end
