class BookingMailer < ApplicationMailer

  def send_notofication_email(booking)
    @booking = booking
    mail(to: "ali2akbar5@gmail.com", subject: "Booking notoficiation")
  end
  
  def send_confirmation_email(booking)
    @booking = booking
    mail(to: "ali2akbar5@gmail.com", subject: "Booking confirmation")
  end

end
