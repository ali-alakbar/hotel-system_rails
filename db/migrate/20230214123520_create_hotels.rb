# frozen_string_literal: true

class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string    :name
      t.string    :city
      t.string    :address
      t.numeric   :phone_number, precision: 15, scale: 0
      t.timestamps
    end
  end
end