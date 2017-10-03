require_relative '../../spec_helper'

describe "when visiting conditions page" do
  it "a user can create a weather condition" do

    visit '/conditions'
    click_on("Add a Condition")

    fill_in('station[name]', with: "Red Light District")
    fill_in("Date",  with: Date.today)
    fill_in("max_temp", with: 100)
    fill_in "min_temp", with: 22
    fill_in "man_humid", with: (100+22)/2
    fill_in "mean_visibility", with: 3
    fill_in "mean_wind_speed", with: 35
    fill_in "Precipitation", with: 3
    click_on "Create"

    condition = Condition.last

    expect(current_path).to eq("/condition/#{condition.id}")

    expect(page).to have_button("Add a Condition")
  end
end
