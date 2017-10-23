require_relative '../../spec_helper'

describe "when visiting conditions page" do
  it "a user can create a weather condition" do
    visit '/conditions'
    click_on("Add a Condition")
    # fill_in "condition[date]",  with: "1/1/11"
    fill_in "condition[max_temp]", with: 100.0
    fill_in "condition[min_temp]", with: 22.0
    fill_in "condition[mean_temp]", with: (100+22)/2.0
    fill_in "condition[mean_humidity]", with: 30.0
    fill_in "condition[mean_visibility]", with: 3.0
    fill_in "condition[mean_wind]", with: 35.0
    fill_in "condition[precipitation]", with: 3.0
    click_on "Create Condition"

    condition = Condition.last

    expect(current_path).to eq("/conditions/#{condition.id}")
    # expect(page).to have_content("Date: #{condition.date}")
    expect(page).to have_content("Precipitation: #{condition.precipitation}")
    expect(page).to have_content("Mean Temperature: #{condition.mean_temp}")
    # expect(page).to have_button("Delete this Condition")
  end
end
