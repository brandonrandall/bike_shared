require_relative '../../spec_helper'

describe "When a user visits a trips page" do
  it "they can see trips" do
    now = Time.now
    trip1 = Trip.create( duration: 60,
                        start_date: now,
                        start_station: 12,
                        end_date: now + 60*60,
                        end_station: 1,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99000)
    trip2 = Trip.create( duration: 60*60,
                        start_date: now,
                        start_station: 1,
                        end_date: now + 60*60*60,
                        end_station: 1,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99000)
    visit '/trips'
    expect(current_path).to eq('/trips')
    # expect(page).to have_content(trip1)
    expect(page).to have_content(trip2.duration)
    expect(page).to have_content(trip2.subscription_type)
  end

  it "they can see a trip" do
    now = Time.now
    trip = Trip.create( duration: 60,
                        start_date: now,
                        start_station: 1,
                        end_date: now + 60*60,
                        end_station: 1,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99000)

    visit "/trips/#{trip.id}"

    expect(page).to have_content(trip[:duration])
    expect(page).to have_content(trip[:start_date])
    expect(page).to have_content(trip[:start_station])
    expect(page).to have_content(trip[:end_date])
    expect(page).to have_content(trip[:end_station])
    expect(page).to have_content(trip[:bike_id])
    expect(page).to have_content(trip[:subscription_type])
    expect(page).to have_content(trip[:zip_code])
  end

  it "they can create a trip" do

    now = Time.now
    visit '/trips'
    click_on("Create a Trip")

    expect(current_path).to eq("/trips/new")

    fill_in("trip[duration]", with: 100)
    fill_in("trip[start_date]", with: now)
    fill_in("trip[start_station]", with: 2)
    fill_in("trip[end_date]", with: now + 100*60)
    fill_in("trip[end_station]", with: 90)
    fill_in("trip[bike_id]", with: 1)
    fill_in("trip[subscription_type]", with: "Subscriber")
    fill_in("trip[zip_code]", with: 99999)
    click_on("Create Trip")

    trip = Trip.last

    expect(current_path).to eq("/trips/#{trip.id}")
    expect(page).to have_content("Duration: #{trip.duration}")
    expect(page).to have_content("Start Date: #{trip.start_date}")
    expect(page).to have_content("Start Station: #{trip.start_station}")
    expect(page).to have_content("End Date: #{trip.end_date}")
    expect(page).to have_content("End Station: #{trip.end_station}")
    expect(page).to have_content("Bike ID: #{trip.bike_id}")
    expect(page).to have_content("Subscription Type: #{trip.subscription_type}")
    expect(page).to have_content("Zip Code: #{trip.zip_code}")
  end
end
