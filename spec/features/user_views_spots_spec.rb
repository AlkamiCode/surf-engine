require "rails_helper"

RSpec.feature "User", type: :feature do
  scenario "clicks on region and sees region spots" do
    visit root_path
    expect(page).to_not have_link("Logout")

    User.find_or_create_from_auth(oauth_data)
    click_link "Login With Facebook"

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Begin Searching By Region")
    expect(page).to_not have_css(".spot")

    click_link("Region")
    click_link("North America")
    # reload_page

    # expect(page).to have_css(".spot")
  end
end
