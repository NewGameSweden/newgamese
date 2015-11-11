class Row < ActiveRecord::Base
  belongs_to :seatmap
  has_many :seats
  validates :name, allow_blank: false, presence: true
  validates :x_coord, allow_blank: false, presence: true
  validates :y_coord, allow_blank: false, presence: true
end
