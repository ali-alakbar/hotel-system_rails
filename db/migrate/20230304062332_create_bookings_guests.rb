# frozen_string_literal: true

class CreateBookingsGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings_guests do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: true
      t.date :check_in_date
      t.date :check_out_date

      t.timestamps
    end
  end
end