class RenameHotelRoomsTableIntoRooms < ActiveRecord::Migration[7.0]
  def change
    rename_table :hotel_rooms, :rooms
  end
end
