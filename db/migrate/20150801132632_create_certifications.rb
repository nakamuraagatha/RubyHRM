class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.string :certification_description
      t.timestamps null: false
    end
  end
end
