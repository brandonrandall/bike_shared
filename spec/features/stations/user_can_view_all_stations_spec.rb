require_relative '../../spec_helper'
# require 'pry'

describe "station views" do
  it "user can see all stations" do
    station = Station.create(name: "The Station",dock_count: 1, city: "Denver", installation_date: Date.today)
    visit "/stations"
    expect(page).to have_content("All Stations")
    expect(page).to have_content("#{station[:name]}")
  end

  it "user can view one station" do
    station = Station.create(name: "The Station",dock_count: 1, city: "Denver", installation_date: Date.today)
    visit "/stations/#{station.id}"
    expect(page).to have_content("#{station[:name]}")
    expect(page).to have_content("#{station[:city]}")
  end

  
end
