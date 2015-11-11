class Seat < ActiveRecord::Base
  belongs_to :row
  validates :name, allow_blank: true, presence: true
end
