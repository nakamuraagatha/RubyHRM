class CreateSystemLanguages < ActiveRecord::Migration
  def change
    create_table :system_languages do |t|
      t.string :language_code
      t.string :language_description
      t.timestamps null: false
    end
  end
end
