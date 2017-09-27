require_relative '../../spec_helper'

describe "when a user visits Stations dashboard" do
  let(:average_per_dock) { Station.all.map(&:dock_count).reduce(:+)/Station.count }
  let(:most_bikes_at_a_station) { Station.all.map {|station| station.dock_count }.max }
  let(:fewest_bikes_at_a_station) { Station.all.map {|station| station.dock_count }.min }
  let(:station_with_most_bikes) { Station.all.max_by {|station| station.dock_count }.name }
  # let(:station_with_fewest_bikes) { Station.all.max_by {|station| station.dock_count }.name }
  # let(:station_with_most_recent_installation)
  # let(:station_with_oldest_installation)
  before(:each) do
    Station.create( name: "The Station6",
                    dock_count: 5,
                    city: "Denver",
                    installation_date: Date.today)
    5.times do |num|
      Station.create( name: "The Station#{num+1}",
                      dock_count: num+1,
                      city: "Denver",
                      installation_date: Date.today)
    end
    # dock_counts = Station.all.map { |station| station.dock_count}
    # total_bikes = dock_counts.reduce(:+)
    visit '/stations-dashboard'
  end

  it "they can see Total count of stations" do

    expect(page).to have_content("Total count of stations: #{Station.count}")
    expect(page).to have_content("Average bikes available per station: #{average_per_dock}")
    expect(page).to have_content("Most bikes available at a station: #{most_bikes_at_a_station}")
    expect(page).to have_content("Fewest bikes available at a station: #{fewest_bikes_at_a_station}")
    expect(page).to have_content("Station(s) where the most bikes are available: #{station_with_most_bikes}")
    # expect(page).to have_content("Station(s) where the fewest bikes are available: #{station_with_fewest_bikes}")
    # expect(page).to have_content("Station with the most recent installation: #{station_with_most_recent_installation}")
    # expect(page).to have_content("Station with the oldest installation: #{station_with_oldest_installation}")
  end
end
