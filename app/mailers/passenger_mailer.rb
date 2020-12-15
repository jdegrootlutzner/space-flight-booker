class PassengerMailer < ApplicationMailer
  def thank_you_email
    p '__________'
    p params
    @passenger = params[:passenger]
    @booking = params[:booking]
    @flight = @booking.flight
    
    mail(to: @passenger.email,
         subject: "Your trip to #{@flight.to.location} is booked!")
  end
end
