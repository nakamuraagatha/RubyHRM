class AddPayGradeToPayDetails < ActiveRecord::Migration
  def change
    add_column :pay_details, :pay_grade_id, :integer
  end
end
