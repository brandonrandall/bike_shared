class Condition < ActiveRecord::Base

  def self.high_on_most_trips_day
    #need to get the max temp and min temp from the conditions
    date_of_most_trips = Trip.most_trips_including_date[0]
    trips = where(date: date_of_most_trips)
    # avg = Condition.avg('extract(date_of_most_trips from date) = ?', date_of_most_trips)
    trips_with_highs = Condition.where(date: date_of_most_trips).map do |trip|
      trip[:max_temp]
    end
    average_high = trips_with_highs.reduce(:+)/trips_with_highs.count

  end

  def self.low_on_most_trips_day
    date_of_most_trips = Trip.most_trips_including_date[0]
    trips = where(date: date_of_most_trips)
    trips_with_lows = Condition.where(date: date_of_most_trips).map do |trip|
      trip[:min_temp]
    end

    average_low = trips_with_lows.reduce(:+)/trips_with_lows.count
  end

  def self.weather_on_least_trips_day

  end
end
