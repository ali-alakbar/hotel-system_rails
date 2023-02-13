class CreateHotelColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :hotels,    :name,            :string
    add_column :hotels,    :city,            :string
    add_column :hotels,    :address,         :string
    add_column :hotels,    :phone_number,    :integer
  end
end
