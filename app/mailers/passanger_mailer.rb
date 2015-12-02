class PassangerMailer < ApplicationMailer

	def thank_you_email(passanger)
		@booking = passanger.booking
		mail(to: passanger.email, subject: "Booking confirmation")
	end
end
