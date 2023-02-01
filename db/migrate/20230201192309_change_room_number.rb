class ChangeRoomNumber < ActiveRecord::Migration[7.0]
  def change
      rename_column :rooms, :room_number, :room_no

  end
end
