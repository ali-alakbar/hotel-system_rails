class BookingMailer < ApplicationMailer

  def booking_confirmation(booking)
    @booking = booking
    mail(to: "ali2akbar5@gmail.com", subject: "Booking confirmation")
  end

end
