class Row < ActiveRecord::Base
  belongs_to :seatmap
  has_many :seats
  validates :name, presence: true, allow_blank: false
  validates :x_coord, presence: true, allow_blank: false
  validates :y_coord, presence: true, allow_blank: false
  accepts_nested_attributes_for :seats
end
