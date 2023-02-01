class RemoveRoomsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :rooms
  end
end
