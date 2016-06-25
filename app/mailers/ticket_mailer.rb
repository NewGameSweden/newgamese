class TicketMailer < ApplicationMailer
	default from: 'info@newgame.se'

	def ticket_mail(mail, event)
		@mail = mail
		@event = event
		mail(to: mail, subject: 'Din biljett till ' +
		 event.name + ' har betalats. 
		 Uppge mailaddressen i entren för att komma in')
	end
end
