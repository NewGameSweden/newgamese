class Seatmap < ActiveRecord::Base
  belongs_to :event
  has_many :rows, dependent: :destroy
  accepts_nested_attributes_for :rows, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  validates :name, allow_blank: false, presence: true
end
