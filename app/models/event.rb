class Event < ActiveRecord::Base
  validates :name, allow_blank: false, presence: true
  validates :description, allow_blank: false, presence: true
  validates :last_reserv_date, allow_blank: false, presence: true
  validates :start_at, allow_blank: false, presence: true
  validates :end_at, allow_blank: false, presence: true
  validates :location, allow_blank: false, presence: true
  mount_uploader :image, EventImageUploader
end
