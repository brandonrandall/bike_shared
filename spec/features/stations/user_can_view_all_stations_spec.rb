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
  xit "user can edit a station" do

  end
  xit "user can destroy a station" do

  end

end
