class RemoveRedundantColumnsInHotelsRoomsEmployees < ActiveRecord::Migration[7.0]
  def change
    remove_column :employees, :hotel_name
    remove_column :employees, :employee_id
    remove_column :rooms,     :hotel_name
    remove_column :rooms,     :room_id
  end
end
