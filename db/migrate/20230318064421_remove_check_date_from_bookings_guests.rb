class RemoveCheckDateFromBookingsGuests < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings_guests, :check_in_date
    remove_column :bookings_guests, :check_out_date
  end
end
