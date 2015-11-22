class Seat < ActiveRecord::Base
  belongs_to :row
  validates :number, allow_blank: true, presence: true
end
