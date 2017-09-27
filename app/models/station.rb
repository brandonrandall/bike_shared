class Station < ActiveRecord::Base

  # validates :name, :dock_count, :city, :installation_date, presence: true

  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true

  def self.average_per_dock
    average(:dock_count)
  end

  def self.most_bikes_at_a_station
    maximum(:dock_count)
  end

  def self.station_with_most_bikes
    where(dock_count: maximum(:dock_count))
  end

end
