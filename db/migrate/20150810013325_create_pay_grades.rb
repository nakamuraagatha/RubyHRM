class CreatePayGrades < ActiveRecord::Migration
  def change
    create_table :pay_grades do |t|
      t.string :description
      t.decimal :minimum
      t.decimal :maximum
      t.string :currency_code
      t.timestamps null: false
    end
  end
end
