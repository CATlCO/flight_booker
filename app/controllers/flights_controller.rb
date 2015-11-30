class FlightsController < ApplicationController

	def index
		@dates = 5.times.map {|i| Date.today + i.day}
		unless params.empty?
			@flights = Flight.where("from_airport_id = ? AND to_airport_id = ? AND date = ?", 
														 params[:from], params[:to], params[:date])
		end
	end
	
end
