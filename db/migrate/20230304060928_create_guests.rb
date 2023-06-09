# frozen_string_literal: true

class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.string :full_name_en
      t.string :full_name_ar
      t.string :id_card_number
      t.string :passport_number
      t.numeric :mobile_number, precision: 15, scale: 0
      t.string :email
      t.date :birthday

      t.timestamps
    end
  end
end