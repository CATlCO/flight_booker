class BookingsController < ApplicationController

	def new
		@flight = Flight.find(params[:flight_id])
		@booking = @flight.bookings.build
		params[:no_of_pas].to_i.times { @booking.passangers.build }
	end

	def create
		@booking = Booking.new(booking_params)
		if @booking.save
			PassangerMailer.thank_you_email(@booking.passangers.first).deliver_now
			redirect_to @booking
		else
			render :new
		end
	end

	def show
		@booking = Booking.find(params[:id])
	end

	private
		def booking_params
			params.require(:booking).permit(:flight_id, passangers_attributes: [:id, :name, :email])
		end
	
end
