require_relative '../../spec_helper'

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

  it "user can create a station" do

    visit "/stations/new"
    fill_in('station[name]', with: "Red Light District")
    fill_in('station[dock_count]', with: 100)
    fill_in('station[city]', with: "Amsterdam")
    fill_in('station[installation_date]', with: "12/12/2012")
    click_button('Create')

    station = Station.last

    expect(current_path).to eq("/stations/#{station.id}")
    expect(page).to have_content("#{station.name}")
    expect(page).to have_content("#{station.city}")
    expect(page).to have_content("#{station.dock_count}")
    expect(page).to have_content("#{station.installation_date}")

  end

  it "user can edit a station" do
    station = Station.create(name: "The Station",dock_count: 1, city: "Denver", installation_date: Date.today)

    visit "/stations/#{station.id}"
    click_on("Edit")
    expect(current_path).to eq("/stations/#{station.id}/edit")

    fill_in('station[name]', with: "Police Station")
    fill_in('station[dock_count]', with: 1000)
    fill_in('station[city]', with: "Hamburg")

    click_on("Update")

    expect(current_path).to eq("/stations/#{station.id}")
    expect(page).to have_content("Police Station")
    expect(page).to have_content("Hamburg")
    expect(page).to have_content(1000)

  end

  it "user can destroy a station" do
    station1 = Station.create(name: "The Station",dock_count: 1, city: "Denver", installation_date: Date.today)
    station2 = Station.create(name: "The Other Station",dock_count: 2, city: "Denver", installation_date: Date.today)
    stations = Station.all
    station_count = Station.all.count

    visit "/stations/#{station1.id}"
    click_on("Edit")
    expect(current_path).to eq("/stations/#{station1.id}/edit")

    click_on("Delete Station")

    new_station_count = Station.all.count

    expect(current_path).to eq("/stations")
    expect(page).not_to have_content("The Station")
    expect(page).to have_content("The Other Station")
    expect(page).to have_content("Station Count: #{new_station_count}")
  end

  it "can edit a station from the index" do
    station1 = Station.create(name: "The Station",dock_count: 1, city: "Denver", installation_date: Date.today)
    station2 = Station.create(name: "The Other Station",dock_count: 2, city: "Denver", installation_date: Date.today)

    visit "/stations"

    within(".station#{station2.id}") do
      click_on("Edit")
    end

    expect(current_path).to eq("/stations/#{station2.id}/edit")
    # expect(page).to have_content("Update")

    click_on("Delete Station")

    new_station_count = Station.all.count

    expect(current_path).to eq("/stations")
    expect(page).not_to have_content("The Other Station")
    expect(page).to have_content("Station Count: #{new_station_count}")

  end

end
