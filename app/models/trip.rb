class Trip < ActiveRecord::Base
  # has_many :stations
  validates :duration, presence: true
  validates :start_date, presence: true
  validates :start_station, presence: true
  validates :end_date, presence: true
  validates :end_station, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true

  def self.average_per_ride
    average(:duration)
  end

  def self.shortest_ride
    minimum(:duration)
  end

  def self.longest_ride
    maximum(:duration)
  end

  def self.most_at_start
    maximum(:start_station)
  end

  def self.least_at_start
    minimum(:start_station)
  end

  def self.number_of_rides_for_each_month
    #need to find the years through inquiries
    years = [2013,2014,2015]
    years.map do |year|
      #again, why cant this hash use symbol notation to
      #create the years?
      {year =>
        Trip.where('extract(year from start_date) = ?', year)
        .group('extract(month from start_date)')
        .count(:id)
      }
      # result..map do |year, months|
      #   year.map do |k,v|
      #   end
    end
  end

end
