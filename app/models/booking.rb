class Booking < ActiveRecord::Base
	belongs_to :flight
	has_many :passangers
	accepts_nested_attributes_for :passangers
end
