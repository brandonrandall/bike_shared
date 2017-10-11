require_relative '../../spec_helper'

describe "when a user visits the root page" do
  it "they can access all other paths" do
    visit '/'
    #expect nav bar to have content
    expect(page).to have_content("Trips")
    expect(page).to have_content("Conditions")
    expect(page).to have_content("Stations")
  end
end
