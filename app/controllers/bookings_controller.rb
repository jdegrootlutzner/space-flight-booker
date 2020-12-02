class BookingsController < ApplicationController
 
  # GET /bookings/new
  def new
    @booking = Booking.new
    set_displayed_values
    @num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(allowed_params)
    if @booking.save
      redirect_to booking_path(@booking.id), notice: 'Event was successfully created.'
    else
      set_displayed_values
      render :new
    end
  end

  def show
    @booking = Booking.last
  end

  private

  def set_displayed_values
    @flight = Flight.find(allowed_params[:flight_id])
    @num_passengers = permitted_value_check
  end

  def permitted_value_check
    return allowed_params[:num_passengers].to_i if (1..5).include?(allowed_params[:num_passengers].to_i)

    1
  end

  def allowed_params
    params.require(:booking).permit(:num_passengers, :flight_id, passengers_attributes: [:first_name, :last_name, :email])
  end
end
