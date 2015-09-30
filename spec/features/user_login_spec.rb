require "rails_helper"

RSpec.feature "User", type: :feature do
  scenario "successfully authenticates with Facebook" do
    visit root_path
    expect(status_code).to be(200)
    expect(page).to_not have_link("Logout")

    User.find_or_create_from_auth(oauth_data)
    click_link "Login With Facebook"

    expect(current_path).to eq(dashboard_path)
    expect(page).to_not have_link("Login With Facebook")
    expect(page).to have_link("Logout")
  end
end
