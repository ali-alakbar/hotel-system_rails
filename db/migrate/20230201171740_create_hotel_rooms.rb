class CreateHotelRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_rooms do |t|
      t.boolean :reserved
      t.string :floor_number
      t.string :room_number
      t.integer :max_capacity
      t.float :total_price
      t.string :room_id

      t.timestamps
    end
  end
end
