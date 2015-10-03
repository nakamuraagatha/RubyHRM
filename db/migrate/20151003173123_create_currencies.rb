class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :currency_code
      t.string :description
      t.timestamps null: false
    end
  end
end
