class Trip < ActiveRecord::Base
  # has_many :stations
  validates :duration, presence: true
  # validates :start_date, presence: true
  validates :start_station, presence: true
  # validates :end_date, presence: true
  validates :end_station, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

end
