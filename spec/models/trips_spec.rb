require_relative '../spec_helper'

RSpec.describe Trip do
  it "isn't valid without a duration" do
    now = Time.now
    trip = Trip.create( start_date: now,
                        start_station: 12,
                        end_date: now + 60*60,
                        end_station: 1,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end
  it "isn't valid without a start date" do
    now = Time.now
    trip = Trip.create( duration: 60,
                        start_station: 12,
                        end_date: now + 60*60,
                        end_station: 1,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end
  it "isn't valid without a start station" do
    now = Time.now
    trip = Trip.create( duration: 60,
                        start_date: now,
                        end_date: now + 60*60,
                        end_station: 1,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end
  it "isn't valid without an end date" do
    now = Time.now
    trip = Trip.create( duration: 60,
                        start_date: now,
                        start_station: 12,
                        end_station: 1,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end
  it "isn't valid without an end station" do
    now = Time.now
    trip = Trip.create( duration: 60,
                        start_date: now,
                        start_station: 12,
                        end_date: now + 60*60,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end
  it "isn't valid without a bike id" do
    now = Time.now
    trip = Trip.create( duration: 60,
                        start_date: now,
                        start_station: 12,
                        end_date: now + 60*60,
                        end_station: 1,
                        subscription_type: "Subscriber",
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end
  it "isn't valid without a subscription type" do
    now = Time.now
    trip = Trip.create( duration: 60,
                        start_date: now,
                        start_station: 12,
                        end_date: now + 60*60,
                        end_station: 1,
                        bike_id: 400,
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end

  it "returns the average duration of a ride" do
    now = Date.today
    4.times do |num|
      Trip.create(duration: (num + num ** num) + 45,
                  start_date: now,
                  start_station: 12,
                  end_date: now + 60*60,
                  end_station: 1,
                  bike_id: 400,
                  subscription_type: "Subscriber",
                  zip_code: 99999)
    end
    average_duration = Trip.all.map(&:duration).reduce(:+)/Trip.count.to_f
    avg_per_ride = Trip.average_per_ride
    expect(average_duration).to eq(avg_per_ride)
  end

  it "returns the longest and highest duration of a ride" do
    now = Date.today
    4.times do |num|
      Trip.create(duration: (num + num ** num) + 45,
                  start_date: now,
                  start_station: 12,
                  end_date: now + 60*60,
                  end_station: 1,
                  bike_id: 400,
                  subscription_type: "Subscriber",
                  zip_code: 99999)
    end
    shortest = Trip.all.map(&:duration).min
    longest = Trip.all.map(&:duration).max
    shortest_ride = Trip.shortest_ride
    longest_ride = Trip.longest_ride
    expect(shortest).to eq(shortest_ride)
    expect(longest).to eq(longest_ride)
  end

  it "returns the station with the most/least rides as a starting point" do
    now = Date.today
    4.times do |num|
      Trip.create(duration: (num ** num) + 45,
                  start_date: now,
                  start_station: (num + 1) * num + 1,
                  end_date: now + 60*60,
                  end_station: 1,
                  bike_id: 400,
                  subscription_type: "Subscriber",
                  zip_code: 99999)
    end
    most = Trip.all.map(&:start_station).max
    least = Trip.all.map(&:start_station).min
    most_at_start = Trip.most_at_start
    least_at_start = Trip.least_at_start
  end

  it "returns a month to month / yearly breakdown of rides" do
    twenty_13 = Date.today << 48
    twenty_14  = Date.today << 36
    twenty_15  = Date.today << 24
    6.times do |num|
      Trip.create(duration: (num) + 45,
                  start_date: twenty_13 + (num*30),
                  start_station: (num) + 1,
                  end_date: twenty_13 + 60*60,
                  end_station: 1,
                  bike_id: 400,
                  subscription_type: "Subscriber",
                  zip_code: 99999)
    end
    5.times do |num|
      Trip.create(duration: (num) + 45,
                  start_date: twenty_14 + (num*30),
                  start_station: (num) + 1,
                  end_date: twenty_14 + 60*60,
                  end_station: 1,
                  bike_id: 400,
                  subscription_type: "Subscriber",
                  zip_code: 99999)
    end
    4.times do |num|
      Trip.create(duration: (num) + 45,
                  start_date: twenty_15 + (num*30),
                  start_station: (num) + 1,
                  end_date: twenty_15 + 60*60,
                  end_station: 1,
                  bike_id: 400,
                  subscription_type: "Subscriber",
                  zip_code: 99999)
    end

    months = Hash.new(0)
    # per_month = Trip.all.sort_by(&:start_date)
    Trip.all.map do |ride|
      ride_month = ride.start_date.strftime("%B")
      # ride_month = ride.start_date
      months[ride_month] += 1
    end
    sorted = months.sort_by {|month,num| Date::MONTHNAMES.index(month)}.to_h
    sorted_months = Trip.number_of_rides_for_each_month
  end
end
