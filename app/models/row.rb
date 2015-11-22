class Row < ActiveRecord::Base
  belongs_to :seatmap
  has_many :seats
  accepts_nested_attributes_for :seats, :allow_destroy => true
  validates :name, allow_blank: false, presence: true
  validates :x_coord, allow_blank: false, presence: true
  validates :y_coord, allow_blank: false, presence: true
end
