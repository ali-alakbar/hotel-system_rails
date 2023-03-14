# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :room, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.date :check_in_date
      t.date :check_out_date
      t.references :holder, null: false, foreign_key: { to_table: :guests }
      t.integer :status, default: 1
      t.timestamps
    end
  end
end