class AddHotelNameToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :hotel_name, :string
  end
end
