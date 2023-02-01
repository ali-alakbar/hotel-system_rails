class ChangeFloorNumber < ActiveRecord::Migration[7.0]
  def change
        rename_column :rooms, :floor_number, :floor_no
  end
end
