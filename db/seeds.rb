# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

airports = [
	"Hartsfield Jackson Atlanta International (ATL)", 
	"Beijing Capital International (PEK)", 
	"London Heathrow (LHR)", 
	"Tokyo International (HND)", 
	"Chicago O'Hare International	(ORD)"] 
	# "Los Angeles International (LAX)", 
	# "Charles de Gaulle International (CDG)", 
	# "Dallas Fort Worth International (DFW)", 
	# "Soekarno-Hatta International	(CGK)", 
	# "Dubai International (DXB)" ]

airports.each {|airport| Airport.create!(name: airport)}

Airport.all.each do |start|
	Airport.all.each do |finish|
		unless start == finish
			5.times do |i|
				5.times do |j|
					Flight.create!(from_airport_id: start.id, to_airport_id: finish.id, 
						date: Date.today + i.day, hour: "#{((j+i)*4)}:00", duration: "2 h 30 m")
				end
			end
		end
	end
end
