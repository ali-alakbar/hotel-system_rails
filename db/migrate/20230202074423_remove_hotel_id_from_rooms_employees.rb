class RemoveHotelIdFromRoomsEmployees < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :hotel_id
    remove_column :employees, :hotel_id
  end
end
