class RenameHotelRoomsColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :rooms, :total_price, :price
    rename_column :rooms, :floor_no, :floor_number
    rename_column :rooms, :room_no, :room_number
  end
end
