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

end
