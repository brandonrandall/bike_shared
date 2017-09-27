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
    expect(page).to have_content(trip1)
    expect(page).to have_content(trip2.duration)
    expect(page).to have_content(trip2.subscription_type)
  end

  xit "they can see a trip" do
    now = Time.now
    trip = Trip.create( duration: 60,
                        start_date: now,
                        start_station: 1,
                        end_date: now + 60*60,
                        end_station: 1,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99000)

  end

  xit "they can create a trip" do
    now = Time.now
    visit '/trips'
    click_on("Create a Trip")
    expect(current_path).to eq("/trips/new")
    fill_in("Duration", with: 100)
    fill_in("Start Date", with: now)
    fill_in("Start Station", with: 2)
    fill_in("End Date", with: now + 100*60)
    fill_in("End Station", with: 90)
    fill_in("Bike ID", with: 1)
    fill_in("Subscription Type", with: "Subscriber")
    fill_in("Zip Code", with: 99999)
    click_on("Create Trip")
    trip = Trip.last

    expect(current_path).to eq("/trips/")
    expect(page).to have_content("")
  end
end
