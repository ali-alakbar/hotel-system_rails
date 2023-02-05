class AddHotelNameToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :hotel_name, :string
  end
end
