class Station < ActiveRecord::Base

  # validates :name, :dock_count, :city, :installation_date, presence: true

  validates :name, presence: true
  validates :dock_count, presence: true
  validates :city, presence: true
  validates :installation_date, presence: true

  def self.average_per_dock
    average(:dock_count).round(1)
  end

  def self.most_bikes_at_a_station
    maximum(:dock_count)
  end

  def self.fewest_bikes_at_a_station
    minimum(:dock_count)
  end

  def self.stations_with_most_bikes
    where(dock_count: maximum(:dock_count)).map { |obj| obj.name }
  end

  def self.stations_with_fewest_bikes
    where(dock_count: minimum(:dock_count)).map { |obj| obj.name }
  end

  def self.station_with_most_recent_installation
    where(installation_date: maximum(:installation_date)).map { |obj| obj.name }.first
  end

  def self.station_with_oldest_installation
    where(installation_date: minimum(:installation_date)).map { |obj| obj.name }.first
  end

end
