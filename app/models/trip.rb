require 'date'
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
    years = [2013,2014,2015]
    years.map do |year|
      found = Trip.where('extract(year from start_date) = ?', year)
      .group('extract(month from start_date)')
      .count(:id)
      months = Hash[found.map{|k,v|[k.to_i,v]}]
      month_names = Hash[months.map{|k,v|[Date::MONTHNAMES[k],v]}]
      {year => month_names }
    end
  end

  def self.most_trips_for_a_day

    #LOOK AT GROUP

    start_dates = Trip.distinct.pluck(:start_date)
    days_with_trips = start_dates.map {|start_date| [start_date,Trip.where(start_date: start_date).count]}
    @date_with_time = days_with_trips.max_by { |day| day[1]}
    days_with_trips.max_by { |day| day[1]}[1]
  end

  def self.most_trips_including_date
    start_dates = Trip.distinct.pluck(:start_date)
    days_with_trips = start_dates.map {|start_date| [start_date,Trip.where(start_date: start_date).count]}
    days_with_trips.max_by { |day| day[1]}
  end

  def self.least_trips_for_a_day

    #LOOK AT GROUP

    start_dates = Trip.distinct.pluck(:start_date)
    days_with_trips = start_dates.map {|start_date| [start_date,Trip.where(start_date: start_date).count]}
    days_with_trips.min_by { |day| day[1]}[1]
  end

end
