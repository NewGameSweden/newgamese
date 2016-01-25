class Ticket < ActiveRecord::Base
  belongs_to :user
  def activate
    if self.token == nil
      self.token = SecureRandom.hex(6)
      self.save
    end
  end
end
