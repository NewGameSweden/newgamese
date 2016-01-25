module TicketsHelper
  def is_token_correct(token)
    Ticket.all.each do |ticket|
      if ticket.token.to_s == token.to_s
        return true
      end
    end
    return false
  end
end
