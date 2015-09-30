require "rails_helper"

RSpec.feature "User logs out", type: :feature do
  scenario "logged in user succesfully logs out" do
    visit root_path

    User.find_or_create_from_auth(oauth_data)
    click_link "Login With Facebook"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link("Logout")
    click_link "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome To SurfEngine")
    expect(page).to have_link("Login With Facebook")
  end
end
