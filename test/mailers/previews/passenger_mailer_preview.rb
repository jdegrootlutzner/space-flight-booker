# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview

  def thank_you_email
    booking = Booking.last
    passenger = booking.passengers.first
    p booking
    p '_________'
    p passenger
    PassengerMailer.with(passenger: passenger, booking: booking).thank_you_email
  end

end
