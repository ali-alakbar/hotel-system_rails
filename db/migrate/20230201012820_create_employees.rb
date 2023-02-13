class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :birthday
      t.date :joining_date
      t.float :salary
      t.float :total

      t.timestamps
    end
  end
end
