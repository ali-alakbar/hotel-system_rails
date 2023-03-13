class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string    :name
      t.string    :city
      t.string    :address
      t.string   :phone_number
      t.timestamps
    end
  end
end
