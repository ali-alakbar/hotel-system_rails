# frozen_string_literal: true

class CreateHotelRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :hotel_rooms do |t|
      t.boolean :reserved, default: false 
      t.string :floor_no
      t.string :room_no
      t.integer :max_capacity
      t.float :total_price

      t.timestamps
    end
  end
end