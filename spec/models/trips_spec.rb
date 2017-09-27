require_relative '../spec_helper'

RSpec.describe Station do
  it "isn't valid without a duration" do
    trip = Trip.create( start_date: now,
                        start_station: 12,
                        end_date: now + 60*60,
                        end_station: 1,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end
  xit "isn't valid without a start date" do
    trip = Trip.create( duration: 60,
                        start_station: 12,
                        end_date: now + 60*60,
                        end_station: 1,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end
  xit "isn't valid without a start station" do
    trip = Trip.create( duration: 60,
                        start_date: now,
                        end_date: now + 60*60,
                        end_station: 1,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end
  xit "isn't valid without an end date" do
    trip = Trip.create( duration: 60,
                        start_date: now,
                        start_station: 12,
                        end_station: 1,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end
  xit "isn't valid without an end station" do
    trip = Trip.create( duration: 60,
                        start_date: now,
                        start_station: 12,
                        end_date: now + 60*60,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end
  xit "isn't valid without a bike id" do
    trip = Trip.create( duration: 60,
                        start_date: now,
                        start_station: 12,
                        end_date: now + 60*60,
                        end_station: 1,
                        subscription_type: "Subscriber",
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end
  xit "isn't valid without a subscription type" do
    trip = Trip.create( duration: 60,
                        start_date: now,
                        start_station: 12,
                        end_date: now + 60*60,
                        end_station: 1,
                        bike_id: 400,
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end
  xit "isn't valid without a zip code" do
    trip = Trip.create( duration: "",
                        start_date: now,
                        start_station: 12,
                        end_date: now + 60*60,
                        end_station: 1,
                        bike_id: 400,
                        subscription_type: "Subscriber",
                        zip_code: 99999)
    expect(trip).to_not be_valid
  end

end
