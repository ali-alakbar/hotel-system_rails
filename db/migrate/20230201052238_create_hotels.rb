class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.string :hotel_id

      t.timestamps
    end
  end
end
