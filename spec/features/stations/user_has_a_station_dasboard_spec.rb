require_relative '../../spec_helper'

describe "when a user visits Stations dashboard" do
  # let(:average_per_dock) { Station.all.map(&:dock_count).reduce(:+)/Station.count }
  # let(:most_bikes_at_a_station) { Station.all.map {|station| station.dock_count }.max }
  # let(:fewest_bikes_at_a_station) { Station.all.map {|station| station.dock_count }.min }
  # let(:station_with_most_bikes) { Station.all.max_by {|station| station.dock_count }.name }
  # let(:station_with_fewest_bikes) { Station.all.max_by {|station| station.dock_count }.name }
  # let(:station_with_most_recent_installation) { Station.all.max_by { |station| station.installation_date }.name }
  # let(:station_with_oldest_installation) { Station.}
  let(:average_per_dock) { Station.average_per_dock }
  let(:most_bikes_at_a_station) { Station.most_bikes_at_a_station }
  let(:fewest_bikes_at_a_station) { Station.fewest_bikes_at_a_station }
  let(:station_with_most_bikes) { Station.stations_with_most_bikes }
  let(:station_with_fewest_bikes) { Station.stations_with_fewest_bikes }
  let(:station_with_most_recent_installation) { Station.station_with_most_recent_installation }
  let(:station_with_oldest_installation) { Station.station_with_oldest_installation }

  before(:each) do
    Station.create( name: "The Station6",
                    dock_count: 5,
                    city: "Denver",
                    installation_date: Date.today - 60)
    5.times do |num|
      Station.create( name: "The Station#{num + 1}",
                      dock_count: num + 1,
                      city: "Denver",
                      installation_date: Date.today + num)
    end

    visit '/stations-dashboard'
  end

  it "they can see Total count of stations" do
    expect(page).to have_content("Total count of stations: #{Station.count}")
  end

  it "they can see Average bikes available per station" do
    expect(page).to have_content("Average bikes available per station: #{average_per_dock}")
  end

  it "they can see Most bikes available at a station" do
    expect(page).to have_content("Most bikes available at a station: #{most_bikes_at_a_station}")
  end

  it "they can see Fewest bikes available at a station" do
    expect(page).to have_content("Fewest bikes available at a station: #{fewest_bikes_at_a_station}")
  end

  it "they can see Station(s) where the most bikes are available" do
    expect(page).to have_content("Station(s) where the most bikes are available: ")
  end

  it "they can see Station(s) where the fewest bikes are available" do
    expect(page).to have_content("Station(s) where the fewest bikes are available: ")
  end

  it "they can see Station with the oldest installation" do
    expect(page).to have_content("Station with the oldest installation: #{station_with_oldest_installation}")
  end

  it "they can see station with the most recent installation" do
    expect(page).to have_content("Station with the most recent installation: #{station_with_most_recent_installation}")
  end
end
