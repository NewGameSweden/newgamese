class Seat < ActiveRecord::Base
  belongs_to :row
  validates :number, presence: true, allow_blank: false
end
