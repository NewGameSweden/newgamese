class Seatmap < ActiveRecord::Base
  belongs_to :event
  has_many :rows, dependent: :destroy
  validates :name, allow_blank: false, presence: true
end
