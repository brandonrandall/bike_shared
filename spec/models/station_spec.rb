require_relative '../spec_helper'

RSpec.describe Station do
  it "isn't valid without name" do
    station = Station.create(dock_count: 1, city: "Denver", installation_date: Date.today)
    expect(station).to_not be_valid
  end
  it "isn't valid without dock_count" do
    station = Station.create(name: "Brandon", dock_count: nil, city: "Denver", installation_date: Date.today)
    expect(station).to_not be_valid
  end
  it "isn't valid without city" do
    station = Station.create(name: "Brandon", dock_count: 1, city: nil, installation_date: Date.today)
    expect(station).to_not be_valid
  end
  it "isn't valid without installation_date" do
    station = Station.create(name: "Brandon", dock_count: 1, city: "Denver", installation_date: nil)
    expect(station).to_not be_valid
  end

  it "returns the average bikes per dock" do
    3.times do |num|
      Station.create( name: "The Station#{num + 1}",
                      dock_count: num + 1,
                      city: "Denver",
                      installation_date: Date.today + num)
    end
    average = Station.all.map(&:dock_count).reduce(:+)/Station.count.to_f
    average_per_dock = Station.average_per_dock
    expect(average).to eq(average_per_dock)
    # binding.pry
  end

  it "returns the station with the latest installation date" do
    3.times do |num|
      Station.create( name: "The Station#{num + 1}",
                      dock_count: num + 1,
                      city: "Denver",
                      installation_date: Date.today + num)
    end
    most_recent = Station.all.max_by { |station| station.installation_date }.name
    most_recent_installation = Station.station_with_most_recent_installation
    expect(most_recent).to eq(most_recent_installation)
  end

  it "returns the station with the oldest installation date" do
    3.times do |num|
      Station.create( name: "The Station#{num + 1}",
                      dock_count: num + 1,
                      city: "Denver",
                      installation_date: Date.today + num)
    end
    oldest = Station.all.min_by { |station| station.installation_date }.name
    oldest_installation = Station.station_with_oldest_installation
    expect(oldest).to eq(oldest_installation)
  end

end
