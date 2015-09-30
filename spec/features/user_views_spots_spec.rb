require "rails_helper"

RSpec.describe "User", type: :feature do
   def wait_for_ajax
     Timeout.timeout(Capybara.default_wait_time) do
       loop until finished_all_ajax_requests?
     end
   end

   def finished_all_ajax_requests?
     # puts "it's running!!!!"
     page.evaluate_script('jQuery.active').zero?
   end

   def wait_until
     Timeout.timeout(Capybara.default_wait_time) do
       sleep(0.1) until value = yield
       value
     end
   end

  xit 'should not have JavaScript errors', :js => true do
    visit root_path
    expect(page).not_to have_errors
  end

  xit "clicks on region and sees region spots", :js => true do
    visit root_path
    expect(page).not_to have_link("Logout")

    User.find_or_create_from_auth(oauth_data)
    click_link "Login With Facebook"

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Begin Searching By Region")
    expect(page).not_to have_selector(".spot")
    expect(page).not_to have_selector("table")

    click_link("Region")
    expect(page).to have_content("North America")
    click_link("North America")
    wait_for_ajax

    wait_until do
      puts "Waiting......"
      find(".spot")
    end
    expect(page).to have_selector(".hey")

    # expect(page).to have_selector(".table")
    # expect(page).to have_selector(".spot")
    # expect(page).to have_content("Wave Quality")
  end

end
