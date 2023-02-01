class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :birthday
      t.date :joining_date
      t.float :salary
      t.string :employee_id
      t.float :total
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
