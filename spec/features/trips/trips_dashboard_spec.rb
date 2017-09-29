require_relative '../../spec_helper'

describe "when a user visits Trips dashboard" do

  let(:average_duration_of_a_ride) { Station.average_duration_per_ride }
  let(:longest_ride) { Station.longest_ride }
  let(:shortest_ride) { Station.shortest_ride }
  # let(:stn_with_most_rides_as_a_starting_point)
  # let(:stn_with_most_rides_as_an_ending_point)
  # let(:number_of_rides_for_each_month)
  # let(:number_of_rides_for_each_year)
  # let(:most_ridden_bike_with_number_of_rides)
  # let(:least_ridden_bike_with_number_of_rides)
  # let(:user_subscription_type_count_and_percentage)
  # let(:date_with_most_trips_and_its_trip_count)
  # let(:date_with_least_trips_and_its_trip_count)

  it "they can see Average duration of a ride." do
    expect(page).to have_content("Average duration per ride: #{average_duration_of_a_ride}")
  end

  it "they can see the Average duration of a ride." do
    expect(page).to have_content()
  end

  it "they can see the Longest ride." do
    expect(page).to have_content()
  end

  it "they can see the Average duration of a ride." do
    expect(page).to have_content()
  end

  it "they can see the Station with the most rides as a starting place." do
    expect(page).to have_content()
  end

  it "they can see the Station with the most rides as an ending place." do
    expect(page).to have_content()
  end

  it "they can see the Month by Month breakdown of number of rides with subtotals for each year." do
    expect(page).to have_content("Jan:")
    expect(page).to have_content("Feb")
    expect(page).to have_content("Mar")
    expect(page).to have_content("Apr")
    expect(page).to have_content("May")
    expect(page).to have_content("June")
    expect(page).to have_content("July")
    expect(page).to have_content("Aug")
    expect(page).to have_content("Sep")
    expect(page).to have_content("Oct")
    expect(page).to have_content("Nov")
    expect(page).to have_content("Dec")
  end

  it "they can see the Most ridden bike with total number of rides for that bike." do
    expect(page).to have_content()
  end

  it "they can see the Least ridden bike with total number of rides for that bike." do
    expect(page).to have_content()
  end

  it "they can see the User subscription type breakout with both count and percentage." do
    expect(page).to have_content()
  end

  it "they can see the Single date with the highest number of trips with a count of those trips." do
    expect(page).to have_content()
  end

  it "they can see the Single date with the lowest number of trips with a count of those trips." do
    expect(page).to have_content()
  end

end
