class Seatmap < ActiveRecord::Base
  has_many :rows
  has_many :seats, :through => :rows
  validates :name, presence: true, allow_blank: false
  accepts_nested_attributes_for :rows
end
